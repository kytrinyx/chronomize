require 'i18n'
require 'date'
require 'extensions/date'

class Chronomize

  attr_accessor :date, :date_format, :yesterday, :today, :tomorrow, :backward, :forward
  def initialize(date, options = {})
    self.date = date
    configure(options)
  end

  def configure(options)
    self.date_format = options[:date_format] || :default
    self.yesterday = options.fetch(:yesterday) {I18n.translate('chronomize.yesterday', :default => 'yesterday')}
    self.today = options.fetch(:today) {I18n.translate('chronomize.today', :default => 'today')}
    self.tomorrow = options.fetch(:tomorrow) {I18n.translate('chronomize.tomorrow', :default => 'tomorrow')}
    self.backward = options.fetch(:previous) do
      # i18n doesn't support nil as default :/
      label = I18n.translate('chronomize.previous', :default => "")
      label.empty? ? nil : label
    end
    self.forward = options.fetch(:next) do
      label = I18n.translate('chronomize.next', :default => "")
      label.empty? ? nil : label
    end
  end

  def previous
    label_for day(-1), :backward
  end

  def current
    label_for day(0)
  end

  def next
    label_for day(1), :forward
  end

  private
  def day(n)
    date + n
  end

  def label_for(date, direction = nil)
    label = chronicality(date)
    pieces = label ? [label] : [format(date)]
    pieces.push forward if direction == :forward
    pieces.unshift backward if direction == :backward
    pieces.compact.join(" ")
  end

  def format(date)
    I18n.localize(date, :format => date_format)
  end

  def chronicality(date)
    if Date.yesterday?(date)
      yesterday
    elsif Date.today?(date)
      today
    elsif Date.tomorrow?(date)
      tomorrow
    end
  end

end

require 'date'
require 'extensions/date'

class Chronomize

  attr_accessor :date, :date_format, :yesterday, :today, :tomorrow, :backward, :forward
  def initialize(date, options = {})
    self.date = date
    self.date_format = options[:date_format] || "%B %-d, %Y"
    self.yesterday = options.fetch(:yesterday) { 'yesterday' }
    self.today = options.fetch(:today) { 'today' }
    self.tomorrow = options.fetch(:tomorrow) { 'tomorrow' }
    self.backward = options[:previous]
    self.forward = options[:next]
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

  def day(n)
    date + n
  end

  def label_for(date, direction = nil)
    pieces = [] << format(date) << chronicality(date)
    pieces.push forward if direction == :forward
    pieces.unshift backward if direction == :backward
    pieces.compact.join(" ")
  end

  def format(date)
    date.strftime(date_format)
  end

  def chronicality(date)
    if Date.yesterday?(date)
      "(#{yesterday})" if yesterday
    elsif Date.today?(date)
      "(#{today})" if today
    elsif Date.tomorrow?(date)
      "(#{tomorrow})" if tomorrow
    end
  end

end

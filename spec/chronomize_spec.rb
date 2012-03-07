require 'spec_helper'

describe Chronomize do

  let(:feb3) { Date.new(2012, 2, 3) }
  let(:feb4) { Date.new(2012, 2, 4) }
  let(:feb5) { Date.new(2012, 2, 5) }
  let(:feb6) { Date.new(2012, 2, 6) }
  let(:feb7) { Date.new(2012, 2, 7) }
  let(:feb8) { Date.new(2012, 2, 8) }
  let(:feb9) { Date.new(2012, 2, 9) }

  before(:each) { Timecop.freeze(feb7) }
  after(:each) { Timecop.return }

  context "today" do
    subject { Chronomize.new(feb7) }

    its(:previous) { should eq('yesterday') }
    its(:current) { should eq('today') }
    its(:next) { should eq('tomorrow') }
  end

  context "tomorrow" do
    subject { Chronomize.new(feb8) }

    its(:previous) { should eq('today') }
    its(:current) { should eq('tomorrow') }
    its(:next) { should eq('February 9, 2012') }
  end

  context "yesterday" do
    subject { Chronomize.new(feb6) }

    its(:previous) { should eq('February 5, 2012') }
    its(:current) { should eq('yesterday') }
    its(:next) { should eq('today') }
  end

  context "last week" do
    subject { Chronomize.new(feb4) }
    its(:previous) { should eq('February 3, 2012') }
    its(:current) { should eq('February 4, 2012') }
    its(:next) { should eq('February 5, 2012') }
  end

  context "with symbols" do
    subject { Chronomize.new(feb6, :previous => '<~', :next => '~>') }
    its(:previous) { should eq('<~ February 5, 2012') }
    its(:current) { should eq('yesterday') }
    its(:next) { should eq('today ~>') }
  end

  context "with alternate day names" do
    subject { Chronomize.new(feb7, :today => "aujourd'hui", :yesterday => 'hier', :tomorrow => 'demain') }

    its(:previous) { should eq('hier') }
    its(:current) { should eq('aujourd\'hui') }
    its(:next) { should eq('demain') }
  end

  context "without day names" do
    subject { Chronomize.new(feb7, :today => nil, :yesterday => nil, :tomorrow => nil) }

    its(:previous) { should eq('February 6, 2012') }
    its(:current) { should eq('February 7, 2012') }
    its(:next) { should eq('February 8, 2012') }
  end

  context "with alternate date format" do
    subject { Chronomize.new(feb4, :date_format => '%-d.%-m.%Y') }

    its(:previous) { should eq('3.2.2012') }
    its(:current) { should eq('4.2.2012') }
    its(:next) { should eq('5.2.2012') }
  end
end

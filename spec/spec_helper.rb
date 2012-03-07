require 'chronomize'
require 'timecop'

RSpec.configure do |config|
  config.backtrace_clean_patterns = [
    /\/lib\d*\/ruby\//,
    /bin\//,
    /spec\/spec_helper\.rb/,
    /lib\/rspec\/(core|expectations|matchers|mocks)/
  ]
end

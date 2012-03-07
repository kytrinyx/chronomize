# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "chronomize"
  s.version     = "0.0.3"
  s.authors     = ["Katrina Owen"]
  s.email       = ["katrina.owen@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Simple dateful navigation.}
  s.description = %q{Creates labels for a window of dates, with knowledge about it's relationship to the current date.}

  s.rubyforge_project = "chronomize"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "timecop"
  s.add_runtime_dependency "i18n"
end

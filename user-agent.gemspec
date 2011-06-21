# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "user-agent/version"

Gem::Specification.new do |s|
  s.name        = "user-agent"
  s.version     = Agent::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["TJ Holowaychuk"]
  s.email       = ['tj@vision-media.ca']
  s.homepage    = ''
  s.summary     = %q{User agent parser}
  s.description = %q{User agent parser}

  s.files         = `git ls-files`.split("\n") - ['specs.watchr']
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "capsize/version"

Gem::Specification.new do |s|
  s.name        = "capsize"
  s.version     = Capsize::VERSION
  s.authors     = ["Corey Woodcox"]
  s.email       = ["corey.woodcox@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{ActiveModel hooks to apply text transformations to fields on save.}
  s.description = %q{Don't like CAPSLOCK'd data in your app? Capsize is for you.}

  s.rubyforge_project = "capsize"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "pry"
  
  s.add_runtime_dependency "activesupport"
end

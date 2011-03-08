# -*- encoding: utf-8 -*-
require File.expand_path("../lib/heatmap/version", __FILE__)
Gem::Specification.new do |s|
  s.name        = "heatmap"
  s.version     = Heatmap::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Andrew Louis"]
  s.email       = ["andrew@hyfen.net"]
  s.homepage    = "https://github.com/hyfen/heatmap"
  s.summary     = "A tool to generate heatmaps"
  s.description = "Generate heatmaps from a series of points (either x,y pixel values or coordinates)."

  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency("rmagick")

  s.add_development_dependency("rspec", "~> 2.0.1")
  s.add_development_dependency("watchr", "~> 0.6")
  s.add_development_dependency("bundler", ">= 1.0.0")

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
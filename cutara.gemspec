# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cutara/version'

Gem::Specification.new do |gem|
  gem.name          = "cutara"
  gem.version       = Cutara::VERSION
  gem.authors       = ["Evgeniy Khatko"]
  gem.email         = ["evgeniy.khatko@gmail.com"]
  gem.description   = %q{ Cutara is the bridge between Tarantula and Cucumber }
  gem.summary       = %q{ Cutara provides rake tasks for integration between Cucumber (test automation tool) and Taranula (test-management tool) }
  gem.homepage      = ""
  gem.add_dependency "page_object_wrapper"
	gem.add_dependency "babosa"
	gem.add_dependency "cucumber"
  gem.add_dependency "httparty"
  gem.add_dependency "activerecord"
	gem.add_development_dependency "rspec", ">= 2.0.0"
	gem.add_development_dependency "debugger"
	gem.add_development_dependency "magic_encoding"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec)/})
  gem.require_paths = ["lib", "tasks", "lib/cutara"] 
end

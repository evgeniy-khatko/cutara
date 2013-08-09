# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |gem|
  gem.name          = "cutara"
  gem.version       = Cutara::VERSION
  gem.authors       = ["Evgeniy Khatko"]
  gem.email         = ["evgeniy.khatko@gmail.com"]
  gem.description   = %q{ Cutara is the bridge between Tarantula and Cucumber }
  gem.summary       = %q{ Cutara provides rake tasks for integration between Cucumber (test automation tool) and Taranula (test-management tool) }
  gem.homepage      = ""
  gem.add_dependency "page_object_wrapper"
  gem.add_dependency "rspec"
	gem.add_dependency "babosa"
	gem.add_dependency "cucumber"
  gem.add_dependency "httparty"
  gem.add_dependency "activerecord", ">= 3.2.11"
  gem.add_dependency "activesupport", ">= 3.2.13"
  gem.add_dependency "rake"
  gem.add_dependency "bundler"
  gem.add_dependency "sinatra"
  gem.add_dependency "padrino-helpers"
  gem.add_dependency "json_pure"
  gem.add_dependency "mongrel", "1.2.0.pre2"
  if RUBY_PLATFORM == 'i386-mingw32'
    gem.add_dependency "win32-process"
    gem.add_dependency "win32-open3-19"
  end
	gem.add_development_dependency "magic_encoding"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec)/})
  gem.require_paths = ["lib"] 
end

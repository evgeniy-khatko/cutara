require 'rake'
require 'bundler'
Bundler.setup
load File.dirname(__FILE__)+"/tasks/build.rake"
load File.dirname(__FILE__)+"/tasks/exec.rake"
load File.dirname(__FILE__)+"/tasks/generate.rake"
load File.dirname(__FILE__)+"/tasks/known.rake"
load File.dirname(__FILE__)+"/tasks/local_exec.rake"

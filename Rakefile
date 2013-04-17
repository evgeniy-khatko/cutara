require 'rake'
require "bundler/gem_tasks"
import "lib/cutara/tasks/known.rake"


task :default => [:test_execution]

desc "Runs tests"
task :test_execution do
  system "cucumber features -r execution"
end

task :test_execution_debug do
  system "cucumber -b features -r execution"
end

desc "Runs generation steps"
task :test_generation do
  system "cucumber -b features -r generation/main"
end

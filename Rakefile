require 'rake'
require "bundler/gem_tasks"

task :default => [:test]

desc "Runs tests"
task :test do
  system "cucumber -b features -r assets"
end

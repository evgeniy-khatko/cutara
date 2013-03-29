require 'rake'
require "bundler/gem_tasks"

task :default => [:test]

desc "Runs tests"
task :test do
  system "cucumber -b features -r assets"
end

desc "Runs generation steps"
task :test_generation do
  system "cucumber -b features -r generation/main"
end

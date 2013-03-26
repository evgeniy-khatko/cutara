require 'Helper'
require 'TarantulaUpdater'

namespace "cutara" do
  desc "executes features custom formatter, which updates tarantila testcase"
  task :exec, :project, :execution, :testcase do |t, args|
    FORMATTER = File.dirname(__FILE__) + "/../lib/CucumberTarantulaFormatter.rb"
    Rake::Task["cutara:download"].execute(:project => args[:project], :testcase => args[:testcase], :execution => args[:execution])
    Rake::Task["cutara:build"].execute
    system "project=\"#{args[:project]}\" execution=\"#{args[:execution]}\" cucumber -b #{ROOT} -r #{FORMATTER} -r #{ROOT} -f Cucumber::Formatter::CustomTarantulaFormatter"
  end
end



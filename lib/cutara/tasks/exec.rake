require 'cutara'
require 'TarantulaUpdater'
namespace "cutara" do
  desc "executes features custom formatter, which updates tarantila testcase"
  task :exec, :project, :testcase, :tag, :execution do |t, args|
    FORMATTER = File.dirname(__FILE__) + "/../../../lib/CucumberTarantulaFormatter.rb"
    Rake::Task["cutara:download"].execute(:project => args[:project], :testcase => args[:testcase], :tag => args[:tag], :execution => args[:execution])
    Rake::Task["cutara:build"].execute
    ENV['project'] = "#{args[:project]}"
    ENV['execution'] = "#{args[:execution]}"
    system "cucumber -b #{Cutara::ROOT} -r #{FORMATTER} -r #{Cutara::ROOT} -f Cucumber::Formatter::CustomTarantulaFormatter"
  end

  desc "executes features custom formatter, which updates tarantila testcase and outputs html"
  task :exec_html_output, :project, :testcase, :tag, :execution do |t, args|
    FORMATTER = File.dirname(__FILE__) + "/../../../lib/CucumberTarantulaHtmlFormatter.rb"
    Rake::Task["cutara:download"].execute(:project => args[:project], :testcase => args[:testcase], :tag => args[:tag], :execution => args[:execution])
    Rake::Task["cutara:build"].execute
    ENV['project'] = "#{args[:project]}"
    ENV['execution'] = "#{args[:execution]}"
    system "cucumber -b #{Cutara::ROOT} -r #{FORMATTER} -r #{Cutara::ROOT} -f Cucumber::Formatter::CustomTarantulaHtmlFormatter"
  end
end

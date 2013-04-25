require 'cutara'
require 'TarantulaUpdater'
namespace "cutara" do
  desc "executes features custom formatter, which updates tarantila testcase"
  task :exec, :project, :testcase, :tag, :execution do |t, args|
    proj = args[:project]
    tc = args[:testcase]
    tag = args[:tag]
    exec = args[:execution]
    FORMATTER = File.dirname(__FILE__) + "/../../../lib/CucumberTarantulaFormatter.rb"
    Rake::Task["cutara:download"].execute(:project => proj.force_encoding("utf-8"), 
                                          :testcase => tc.force_encoding("utf-8"), 
                                          :tag => tag.force_encoding("utf-8"), 
                                          :execution => exec.force_encoding("utf-8")
                                          )
    Rake::Task["cutara:build"].execute
    ENV['project'] = proj.force_encoding("utf-8")
    ENV['execution'] = exec.force_encoding("utf-8")
    system "cucumber -b #{Cutara::ROOT} -r #{FORMATTER} -r #{Cutara::ROOT} -f Cucumber::Formatter::CustomTarantulaFormatter"
  end

  desc "executes features custom formatter, which updates tarantila testcase and outputs html"
  task :exec_html_output, :project, :testcase, :tag, :execution do |t, args|
    proj = args[:project]
    tc = args[:testcase]
    tag = args[:tag]
    exec = args[:execution]
    FORMATTER = File.dirname(__FILE__) + "/../../../lib/CucumberTarantulaHtmlFormatter.rb"
    Rake::Task["cutara:download"].execute(:project => proj.force_encoding("utf-8"), 
                                          :testcase => tc.force_encoding("utf-8"), 
                                          :tag => tag.force_encoding("utf-8"), 
                                          :execution => exec.force_encoding("utf-8")
                                          )
    Rake::Task["cutara:build"].execute
    ENV['project'] = proj.force_encoding("utf-8")
    ENV['execution'] = exec.force_encoding("utf-8")
    system "cucumber -b #{Cutara::ROOT} -r #{FORMATTER} -r #{Cutara::ROOT} -f Cucumber::Formatter::CustomTarantulaHtmlFormatter"
  end
end

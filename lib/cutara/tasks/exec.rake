require 'cutara'
require 'TarantulaUpdater'
namespace "cutara" do
  desc "executes features custom formatter, which updates tarantila testcase"
  task :exec, :project, :testcase, :tag, :execution do |t, args|
    proj = args[:project].force_encoding("utf-8") unless args[:project].nil?
    tc = args[:testcase].force_encoding("utf-8") unless args[:testcase].nil?
    tag = args[:tag].force_encoding("utf-8") unless args[:tag].nil?
    exec = args[:execution].force_encoding("utf-8") unless args[:execution].nil?
    FORMATTER = File.dirname(__FILE__) + "/../../../lib/CucumberTarantulaFormatter.rb"
    Rake::Task["cutara:download"].execute(:project => proj, 
                                          :testcase => tc, 
                                          :tag => tag, 
                                          :execution => exec
                                          )
    Rake::Task["cutara:build"].execute
    ENV['project'] = proj
    ENV['execution'] = exec
    system "cucumber -b #{Cutara::ROOT} -r #{FORMATTER} -r #{Cutara::ROOT} -f Cucumber::Formatter::CustomTarantulaFormatter"
  end

  desc "executes features custom formatter, which updates tarantila testcase and outputs html"
  task :exec_html_output, :project, :testcase, :tag, :execution do |t, args|
    proj = args[:project].force_encoding("utf-8") unless args[:project].nil?
    tc = args[:testcase].force_encoding("utf-8") unless args[:testcase].nil?
    tag = args[:tag].force_encoding("utf-8") unless args[:tag].nil?
    exec = args[:execution].force_encoding("utf-8") unless args[:execution].nil?
    FORMATTER = File.dirname(__FILE__) + "/../../../lib/CucumberTarantulaHtmlFormatter.rb"
    Rake::Task["cutara:download"].execute(:project => proj, 
                                          :testcase => tc, 
                                          :tag => tag, 
                                          :execution => exec
                                          )
    Rake::Task["cutara:build"].execute
    ENV['project'] = proj
    ENV['execution'] = exec
    system "cucumber -b #{Cutara::ROOT} -r #{FORMATTER} -r #{Cutara::ROOT} -f Cucumber::Formatter::CustomTarantulaHtmlFormatter"
  end
end

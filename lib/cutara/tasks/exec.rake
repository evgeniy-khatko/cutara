require 'cutara'
require 'TarantulaUpdater'
namespace "cutara" do
  desc "executes features custom formatter, which updates tarantila testcase"
  task :exec, :project, :testcase, :tag, :execution do |t, args|
    proj = args[:project].force_encoding("utf-8") unless proj.nil?
    tc = args[:testcase].force_encoding("utf-8") unless tc.nil?
    tag = args[:tag].force_encoding("utf-8") unless tag.nil?
    exec = args[:execution].force_encoding("utf-8") unless exec.nil?
    FORMATTER = File.dirname(__FILE__) + "/../../../lib/CucumberTarantulaFormatter.rb"
    Rake::Task["cutara:download"].execute(:project => proj, 
                                          :testcase => tc, 
                                          :tag => tag, 
                                          :execution => exec
                                          )
    Rake::Task["cutara:build"].execute
    ENV['project'] = proj.force_encoding("utf-8")
    ENV['execution'] = exec.force_encoding("utf-8")
    system "cucumber -b #{Cutara::ROOT} -r #{FORMATTER} -r #{Cutara::ROOT} -f Cucumber::Formatter::CustomTarantulaFormatter"
  end

  desc "executes features custom formatter, which updates tarantila testcase and outputs html"
  task :exec_html_output, :project, :testcase, :tag, :execution do |t, args|
    proj = args[:project].force_encoding("utf-8") unless proj.nil?
    tc = args[:testcase].force_encoding("utf-8") unless tc.nil?
    tag = args[:tag].force_encoding("utf-8") unless tag.nil?
    exec = args[:execution].force_encoding("utf-8") unless exec.nil?
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

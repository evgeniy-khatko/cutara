require 'TarantulaUpdater'
require 'cutara'
require "rexml/document"
include REXML
include FileUtils::Verbose
@lang = YAML.load(File.open(Cutara::SUPPORT+"/tarantula.yml"))["language"] if File.exist? Cutara::SUPPORT+'/tarantula.yml'
namespace "cutara" do
  desc "Builds cucumber project"
  task :build, [:project, :testcase, :tag, :execution] => :download do
    mkdir_p(Cutara::PAGES) unless File.exists?(Cutara::PAGES)
    mkdir_p(Cutara::STEPS) unless File.exists?(Cutara::STEPS)
    cp "#{Cutara::EXECUTION}/support/env.rb", Cutara::SUPPORT unless File.exists? "#{Cutara::SUPPORT}/env.rb"
    cp "#{Cutara::EXECUTION}/support/helper.rb", Cutara::SUPPORT unless File.exists? "#{Cutara::SUPPORT}/helper.rb"
    cp "#{Cutara::EXECUTION}/step_definitions/#{@lang.to_s}/predefined_steps.rb", Cutara::STEPS unless File.exists? "#{Cutara::STEPS}/predefined_steps.rb"
  end

  desc "Downloads cucumber scenarios from tarantula"
  task :download, :project, :testcase, :tag, :execution do |t, args|
    raise "arguments: [project*,testcase,tag,execution]" if args.empty?
    rm Dir.glob(Cutara::ROOT+'/*.feature'), :force => true   
    unless File.exist?(Cutara::SUPPORT+"/tarantula.yml")
      mkdir_p(Cutara::SUPPORT) unless File.exists?(Cutara::SUPPORT) # including ROOT dir
      cp "#{Cutara::EXECUTION}/support/tarantula.yml", Cutara::SUPPORT
      raise ">>>>>>>>>>> Please update #{Cutara::SUPPORT}/tarantula.yml and rerun the task <<<<<<<<<<<<"
    end
    Cutara::TarantulaUpdater.config = YAML.load(File.open(Cutara::SUPPORT+"/tarantula.yml"))
    query = {}
    args.each{ |k,v| query[k.to_s]=v }
    resp = Cutara::TarantulaUpdater.get_tests(query)
    resp = REXML::Document.new resp.body
    resp.elements.each('test/test') do |test|
      title = test.elements['title'].text
      puts ">>>>>>>>>>> Got feature: #{title} <<<<<<<<<<<<"
      body = test.elements['body'].text
      file = File.new(Cutara::ROOT+"/#{title.to_label}.feature", "w+")
      file.puts "# language: #{@lang.to_s}"
      file.puts body
      file.close
    end
  end
end

require 'TarantulaUpdater'
require 'cutara'
require "rexml/document"
include REXML
include FileUtils::Verbose
@lang = YAML.load(File.open(Cutara::SUPPORT+"/tarantula.yml"))["language"] if File.exist? Cutara::SUPPORT+'/tarantula.yml'
namespace "cutara" do
  desc "Builds cucumber project"
  task :build, [:project, :testcase, :execution] => :download do
    mkdir_p(Cutara::PAGES) unless File.exists?(Cutara::PAGES)
    mkdir_p(Cutara::STEPS) unless File.exists?(Cutara::STEPS)
    cp "#{Cutara::ASSETS}/env.rb", Cutara::SUPPORT unless File.exists? "#{Cutara::SUPPORT}/env.rb"
    steps_source = Cutara::ASSETS + "/step_definitions/" + @lang
    Dir.glob("#{steps_source}/*") {|f| cp File.expand_path(f), Cutara::STEPS }
  end

  desc "Downloads cucumber scenarios from tarantula"
  task :download, :project, :testcase, :execution do |t, args|
    raise "arguments: [project*,testcase,execution]" if args.empty?

    unless File.exist?(Cutara::SUPPORT+"/tarantula.yml")
      mkdir_p(Cutara::SUPPORT) unless File.exists?(Cutara::SUPPORT) # including ROOT dir
      cp "#{Cutara::ASSETS}/tarantula.yml", Cutara::SUPPORT
      raise "Please update #{Cutara::SUPPORT}/tarantula.yml and rerun the task"
    end
    Cutara::TarantulaUpdater.config = YAML.load(File.open(Cutara::SUPPORT+"/tarantula.yml"))
    query = {}
    args.each{ |k,v| query[k.to_s]=v }
    resp = Cutara::TarantulaUpdater.get_tests(query)
    resp = REXML::Document.new resp.body
    resp.elements.each('test/test') do |test|
      title = test.elements['title'].text
      body = test.elements['body'].text
      file = File.new(Cutara::ROOT+"/#{title.to_label}.feature", "w+")
      file.puts "# language: #{@lang}"
      file.puts body
      file.close
    end
  end
end

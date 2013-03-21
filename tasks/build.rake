require 'TarantulaUpdater'
require "rexml/document"
require 'Helper'
include REXML


namespace "cutara" do
  desc "Builds cucumber project"
  task :build, [:project, :testcase, :execution] => :download do
    FileUtils.mkdir_p(PAGES) unless File.exists?(PAGES)
    FileUtils.mkdir_p(STEPS) unless File.exists?(STEPS)
    FileUtils.cp "#{ASSETS}/env.rb", SUPPORT
    steps_source = ASSETS+"/step_definitions/#{YAML.load(File.open(SUPPORT+"/tarantula.yml"))["language"]}"
    Dir.glob("#{steps_source}/*") {|f| FileUtils.cp File.expand_path(f), STEPS }
  end

  desc "Downloads cucumber scenarios from tarantula"
  task :download, :project, :testcase, :execution do |t, args|
    raise "arguments: [project*,testcase,execution]" if args.empty?

    unless File.exist?(SUPPORT+"/tarantula.yml")
      FileUtils.mkdir_p(SUPPORT) unless File.exists?(SUPPORT) # including ROOT dir
      FileUtils.cp "#{ASSETS}/tarantula.yml", SUPPORT
      raise "Please update #{SUPPORT}/tarantula.yml and rerun the task"
    end
    TarantulaUpdater.config = YAML.load(File.open(SUPPORT+"/tarantula.yml"))
    query = {}
    args.each{ |k,v| query[k.to_s]=v }
    resp = TarantulaUpdater.get_tests(query)
    resp = REXML::Document.new resp.body
    resp.elements.each('test/test') do |test|
      title = test.elements['title'].text
      body = test.elements['body'].text
      file = File.new(ROOT+"/#{title.to_label}.feature", "w+")
      file.puts body
      file.close
    end
  end

end


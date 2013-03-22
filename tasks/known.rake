require 'Helper'
@lang = YAML.load(File.open(SUPPORT+"/tarantula.yml"))["language"] if File.exist? SUPPORT+'/tarantula.yml'
namespace "cutara" do
  desc "Show sentences used inside step definitions"
  task :known do
    DEFINITION_LINE = Regexp.new /\/\^(.+?)\$\//
    steps_def_path = ASSETS+"/step_definitions/#{@lang}"
    raise "#{steps_def_path} directory not found" unless File.exist? steps_def_path
    out = {}
    step_definitions = Dir.new steps_def_path
    step_definitions.recursive_each{|fn|
      if File.extname(fn) == '.rb'
        bn = File.basename(fn, '.rb')
        out[bn] = []
        File.new(fn).readlines.each{|line|
          if DEFINITION_LINE.match line
            out[bn] << "#{$1.gsub("(.*?)","")}"
          end
        }
      end
    }
    out.keys.sort.each{ |file| puts "#{out[file].join("\n")}" }
  end
end

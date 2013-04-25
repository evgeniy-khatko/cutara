require 'cutara'
@lang = YAML.load(File.open(Cutara::SUPPORT+"/tarantula.yml"))["language"] if File.exist? Cutara::SUPPORT+'/tarantula.yml'
namespace "cutara" do
  desc "Show sentences used inside step definitions"
  task :known do
    DEFINITION_LINE = Regexp.new /\/\^(.+?)\$\//
    steps_def_path = Cutara::EXECUTION+"/step_definitions/#{@lang}"
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
    out.keys.sort.each{ |file| 
      sent = "#{out[file].join("\n")}" 
      puts sent.force_encoding("utf-8") unless sent.nil?
    }
  end
end

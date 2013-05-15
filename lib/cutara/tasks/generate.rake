require 'cutara'
include FileUtils::Verbose
@lang = YAML.load(File.open(Cutara::SUPPORT+"/tarantula.yml"))["language"] if File.exist? Cutara::SUPPORT+'/tarantula.yml'

namespace "cutara" do
  desc "Generates page_objects according to page_object_wrapper gem"
  task :generate do
    raise "#{Cutara::ROOT} not found, please run rake cutara:build before running this task" unless File.exist? Cutara::ROOT
    raise "#{Cutara::STEPS} not found, please run rake cutara:build before running this task" unless File.exist? Cutara::STEPS
    complex_steps_files = Dir.glob("#{Cutara::STEPS}/*.rb").delete_if{ |path| path =~ /predifined_steps/ }
    cp complex_steps_files, Cutara::GENERATION
    result = `cucumber #{Cutara::ROOT} -r #{Cutara::GENERATION} -b -f progress`
    puts result
  end
end

require 'cutara'
include FileUtils::Verbose
@lang = YAML.load(File.open(Cutara::SUPPORT+"/tarantula.yml"))["language"] if File.exist? Cutara::SUPPORT+'/tarantula.yml'

namespace "cutara" do
  desc "Generates page_objects according to page_object_wrapper gem"
  task :generate do
    prepare_steps
    result = `cucumber #{Cutara::ROOT} -r #{Cutara::GENERATION} -f progress`
    puts result
  end

  desc "Similar to cutara:generate but with more verbose output"
  task :generate_debug do
    prepare_steps
    result = `cucumber #{Cutara::ROOT} -b -r #{Cutara::GENERATION}`
    puts result
  end

  def prepare_steps
    raise "#{Cutara::ROOT} not found, please run rake cutara:build before running this task" unless File.exist? Cutara::ROOT
    raise "#{Cutara::STEPS} not found, please run rake cutara:build before running this task" unless File.exist? Cutara::STEPS
    complex_steps_files = Dir.glob("#{Cutara::STEPS}/*.rb").delete_if{ |path| path =~ /predefined_steps/ }
    cp complex_steps_files, "#{Cutara::GENERATION}/step_definitions/#{@lang}"
  end
end

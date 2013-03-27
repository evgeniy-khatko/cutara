require 'cutara'

namespace "cutara" do
  desc "Generates page_objects according to page_object_wrapper gem"
  task :generate do
    raise "#{Cutara::ROOT} not found, please run rake cutara:build before running this task" unless File.exist? Cutara::ROOT
    generation_dir = File.dirname(__FILE__)+"/../../../generation/main"
    result = `cucumber #{Cutara::ROOT} -r #{generation_dir} -f progress`
    puts result
  end
end

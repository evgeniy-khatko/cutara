require 'cutara'
include Cutara
@lang = YAML.load(File.open(Cutara::SUPPORT+"/tarantula.yml"))["language"] if File.exist? Cutara::SUPPORT+'/tarantula.yml'
namespace "cutara" do
  desc "Converts string from given language to a label"
  task :transliterate, :string do |t, args|
    str = args[:string]
    puts str.to_label
  end
end

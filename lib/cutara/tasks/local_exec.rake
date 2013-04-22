require 'cutara'
namespace "cutara" do
  desc "executes features locally with default formatter"
  task :local_exec do
    system "cucumber #{Cutara::ROOT} -f html"
  end
end

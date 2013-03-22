require 'Helper'
namespace "cutara" do
  desc "executes features locally with default formatter"
  task :local_exec do
    system "cucumber -b #{ROOT}"
  end
end


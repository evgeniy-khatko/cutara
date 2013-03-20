require 'TarantulaUpdater'

namespace "cutara" do
  desc "Builds cucumber project"
  task :build, [:project, :testcase, :execution] => :download do
  end


  desc "Downloads cucumber scenarios from tarantula"
  task :download, :project, :testcase, :execution do |t, args|
    raise "arguments: [project*,language*,testcase,execution]" if args.empty?
    query = {}
    args.each{ |k,v| query[k.to_s]=v }
    resp = TarantulaUpdater.get_tests(query)
    puts resp.body
  end
end


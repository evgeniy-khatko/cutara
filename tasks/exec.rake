require 'Helper'
require 'TarantulaUpdater'

namespace "cutara" do
  desc "executes features custom formatter, which updates tarantila testcase"
  task :exec, :project, :execution, :testcase do |t, args|
    Rake::Task[:build].invoke(args[:project], args[:testcase], args[:execution])
    system "project=#{args[:project]} execution=#{args[:execution]} cucumber -b #{ROOT} -f CustomTarantulaFormatter"
  end
end



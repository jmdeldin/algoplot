require 'rake/clean'
require 'rake/testtask'

CLEAN.include '*.gem'

Rake::TestTask.new do |t|
  t.test_files = FileList['spec/*_spec.rb']
end

desc 'build gem'
task :gemify do
  sh "gem build algoplot.gemspec"
end

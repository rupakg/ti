require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name        = "ti"
  gem.homepage    = "http://github.com/revans/ti"
  gem.license     = "MIT"
  gem.summary     = %Q{Ti}
  gem.description = %Q{Titanium Commandline Helper}
  gem.email       = "robert@codewranglers.org"
  gem.authors     = ["Robert R Evans", "Julius Francisco"]
  gem.date        = "2011-04-16"
  gem.executables = ["ti"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "ti #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'rspec/core'
require 'rspec/core/rake_task'

task :default => :spec

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = '--color'
end

namespace :spec do

  desc "Run specs verbosely"
  RSpec::Core::RakeTask.new('verbose') do |t|
    t.rspec_opts = '--color --format documentation'
  end

  desc "Run specs with html report"
  RSpec::Core::RakeTask.new('html') do |t|
    t.rspec_opts = '--color --format html'
  end

end

require 'rake'
require 'rake/testtask'
require 'rake/gempackagetask'
require 'rake/rdoctask'

# Runs the test suite
Rake::TestTask.new do |task|
  task.test_files = FileList["test/*test.rb"]
end

# Packages the gem
gem_spec = Gem::Specification.new do |spec|
  spec.name = "assit"
  spec.version = "0.0.1"
  spec.author = "Daniel Hahn"
  spec.email = "dhahn@gmx.de"
  spec.homepage = "http://talia.discovery-project.eu/"
  spec.platform = Gem::Platform::RUBY
  spec.summary = "An assertion framework for Ruby"
  spec.files = FileList["{lib}/**/*"].to_a
  spec.require_path = "lib"
  spec.test_files = FileList["{test}/**/*test.rb"].to_a
end

Rake::GemPackageTask.new(gem_spec) do |pkg|
  pkg.need_tar = true
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_files.include("lib/**/*rb")
  rdoc.title    = 'Simple Assert'
  rdoc.options << '--line-numbers' << '--inline-source'
end

task :cruise => ['test', 'rdoc']

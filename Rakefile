$: << File.dirname(__FILE__)
require 'meta_project'
require 'rake'
require 'rake/testtask'
require 'rake/clean'
require 'rake/rdoctask'
require 'jeweler'
require 'gokdok'
load 'assit.gemspec'

CLEAN.include("pkg", "lib/*.bundle", "html", "*.gem", ".config")

# Runs the test suite
Rake::TestTask.new do |task|
  task.test_files = FileList["test/*test.rb"]
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_files.include("lib/**/*rb")
  rdoc.rdoc_files.include('LICENSE', 'README.rdoc')
  rdoc.main = "README.rdoc"
  rdoc.title = "Assit documentation"
  rdoc.options << '--line-numbers' << '--inline-source'
end


Jeweler::Tasks.new do |s|
  s.name = "assit"
  s.summary = "Assit. Runtime assertions for Ruby."
  s.email = "ghub@limitedcreativity.org"
  s.homepage = "http://averell23.github.com/assit"
  s.description = "Lightweight library that provides easy-to-use runtime assertions for Ruby"
  s.authors = ["Daniel Hahn"]
  s.extra_rdoc_files = ["README.rdoc", "CHANGES", "LICENSE"]
  s.files = FileList["{lib,test}/**/*"]
end

Gokdok::Dokker.new do |gd|
  gd.pages_home = 'gh-pages'
  gd.remote_path = 'rdoc'
end

task :cruise => ['test', 'rdoc']

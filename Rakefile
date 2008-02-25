require 'meta_project'
require 'rake'
require 'rake/testtask'
require 'rake/clean'
require 'rake/gempackagetask'
require 'rake/rdoctask'
require 'rake/contrib/xforge'

$name = 'assit'
$version = '0.0.3'

CLEAN.include("pkg", "lib/*.bundle", "html", "*.gem", ".config")

# Runs the test suite
Rake::TestTask.new do |task|
  task.test_files = FileList["test/*test.rb"]
end

# Packages the gem
gem_spec = Gem::Specification.new do |spec|
  spec.name = $name
  spec.version = $version
  spec.author = "Daniel Hahn"
  spec.email = "dhahn@gmx.de"
  spec.summary = "An assertion framework for Ruby"
  spec.description = "This is an assertion framework for Ruby."
  spec.homepage = "http://assit.rubyforge.org"  
  spec.platform = Gem::Platform::RUBY
  spec.files = FileList["{lib}/**/*"].to_a
  spec.require_path = "lib"
  spec.test_files = FileList["{test}/**/*test.rb"].to_a
  spec.rubyforge_project = 'assit'
  spec.has_rdoc = true
end

Rake::GemPackageTask.new(gem_spec) do |pkg|
  pkg.need_tar = true
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_files.include("lib/**/*rb")
  rdoc.rdoc_files.include('LICENSE', 'README')
  rdoc.main = "README"
  rdoc.title = "Assit documentation"
  rdoc.options << '--line-numbers' << '--inline-source'
end

task :verify_rubyforge do
  raise "RUBYFORGE_USER environment variable not set!" unless ENV['RUBYFORGE_USER']
  raise "RUBYFORGE_PASSWORD environment variable not set!" unless ENV['RUBYFORGE_PASSWORD']
end

desc "release #$name-#$version gem on RubyForge"
task :release => [ :clean, :verify_rubyforge, :package ] do
  $project  = MetaProject::Project::XForge::RubyForge.new('assit')
  release_files = FileList["pkg/#$name-#$version.gem", "CHANGES"]
  Rake::XForge::Release.new($project) do |release|
    release.user_name     = ENV['RUBYFORGE_USER']
    release.password      = ENV['RUBYFORGE_PASSWORD']
    release.files         = release_files.to_a
    release.release_name  = "#$name #$version"
    release.package_name  = "assit"
    release.version       = $version
  end
end

task :cruise => ['test', 'rdoc']

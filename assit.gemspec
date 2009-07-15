# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{assit}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Daniel Hahn"]
  s.date = %q{2009-07-15}
  s.description = %q{Lightweight library that provides easy-to-use runtime assertions for Ruby}
  s.email = %q{ghub@limitedcreativity.org}
  s.extra_rdoc_files = ["README.rdoc", "CHANGES", "LICENSE"]
  s.files = ["lib/assit", "lib/assit/actions", "lib/assit/actions/console_action.rb", "lib/assit/actions/debug_action.rb", "lib/assit/actions/raise_action.rb", "lib/assit/assertions.rb", "lib/assit/assit_config.rb_example", "lib/assit/disable_assertions.rb", "lib/assit/loader.rb", "lib/assit/setup_assertions.rb", "lib/assit.rb", "lib/assit_config.rb", "test/assit_test.rb", "test/disabled_helper.rb", "README.rdoc", "CHANGES", "LICENSE"]
  s.has_rdoc = true
  s.homepage = %q{http://averell23.github.com/assit}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Assit. Runtime assertions for Ruby.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

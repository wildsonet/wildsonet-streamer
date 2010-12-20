# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{wildsonet-streamer}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marek Jelen"]
  s.date = %q{2010-12-20}
  s.default_executable = %q{wildsonet-streamer.rb}
  s.description = %q{Simple way to stream data from serve to clients browser}
  s.email = %q{marek@jelen.biz}
  s.executables = ["wildsonet-streamer.rb"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".DS_Store",
    ".document",
    "Gemfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bin/wildsonet-streamer.rb",
    "js/jquery.js",
    "js/streamer.js",
    "js/test.html",
    "lib/handler.rb",
    "lib/server.rb",
    "lib/wildsonet-streamer.rb",
    "test/helper.rb",
    "test/test_wildsonet-streamer.rb",
    "wildsonet-streamer.gemspec"
  ]
  s.homepage = %q{http://github.com/marekjelen/wildsonet-streamer}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Streaming data to browser}
  s.test_files = [
    "test/helper.rb",
    "test/test_wildsonet-streamer.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<wildsonet-netty>, [">= 0"])
      s.add_runtime_dependency(%q<wildsonet-hazelcast>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<wildsonet-netty>, [">= 0"])
      s.add_dependency(%q<wildsonet-hazelcast>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<wildsonet-netty>, [">= 0"])
    s.add_dependency(%q<wildsonet-hazelcast>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end


lib = File.join(File.dirname(__FILE__), "lib")
$: << lib unless $:.include?(lib)

require "wildsonet-streamer-version"

Gem::Specification.new do |s|

  s.name = "wildsonet-streamer"
  s.version = WildSoNet::Streamer::VERSION
  s.authors = ["Marek Jelen"]
  s.summary = "Stream data to client's browsers"
  s.description = "Simple way to stream data to client's browsers"
  s.email = "marek@jelen.biz"
  s.homepage = "http://github.com/marekjelen/wildsonet-streamer"
  s.licenses = ["MIT"]

  s.platform = "java"
  s.required_rubygems_version = ">= 1.3.6"

  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]

  s.files = [
    "Gemfile",
    "LICENSE.txt",
    "README.rdoc",
    "lib/wildsonet-streamer.rb",
    "lib/wildsonet-streamer-version.rb",
    "lib/handler.rb",
    "lib/server.rb",
    "wildsonet-streamer.gemspec"
  ]

  s.require_paths = ["lib"]

  s.test_files = [
  ]

  s.add_runtime_dependency("wildsonet-netty", ["> 0.0"])
  s.add_runtime_dependency("wildsonet-hazelcast", ["> 0.0"])
end


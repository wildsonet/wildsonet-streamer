require "rubygems"
require "bundler"

Bundler.setup
Bundler.require(:default)

$: << File.join( File.dirname(__FILE__), "..", "lib" )

require File.join( File.dirname(__FILE__), "..", "lib", "wildsonet-streamer")

WildSoNet::Streamer::Server.start(3001)
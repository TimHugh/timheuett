#!/usr/bin/ruby

require 'rubygems'

fastcgi_log = File.open("fastcgi.log", "a")
STDOUT.reopen fastcgi_log
STDERR.reopen fastcgi_log
STDOUT.sync = true 

#Gem.path.unshift("/home6/timhughn/ruby/gems")
ENV["GEM_HOME"] = "/home6/timhughn/ruby/gems"

# sinatra should load now
require 'sinatra'

module Rack
  class Request
    def path_info
      @env["REDIRECT_URL"].to_s
    end
    def path_info=(s)
      @env["REDIRECT_URL"] = s.to_s
    end
  end
end

require_relative 'app'

builder = Rack::Builder.new do
  use Rack::ShowStatus
  use Rack::ShowExceptions
  
  run Sinatra::Application
end

Rack::Handler::FastCGI.run(builder)


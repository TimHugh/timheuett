#!/usr/bin/env ruby

require 'bundler'
Bundler.require

module Site
  class Application < Sinatra::Application
    configure do
      enable :static, :method_override
      set root: File.dirname(__FILE__)
    end

    get '/' do
      slim :index
    end

    get '*' do
      redirect to('/')
    end

    use Rack::Deflater
  end
end

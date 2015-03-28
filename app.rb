#!/usr/bin/env ruby

require 'bundler'
Bundler.require

module Site
  class Application < Sinatra::Application
    configure do
      enable :static, :method_override
      set root: File.dirname(__FILE__)
    end

    get "/" do
      haml :index
    end

    def link_to(text, attributes = {})
      attr_string = attributes.map { |k, v| "#{k}=\"#{v}\"" }.join(" ")
      "<a #{attr_string}>#{text}</a>"
    end

    use Rack::Deflater
  end
end

#!/usr/bin/env ruby

require 'sinatra/base'
require 'haml'

module MyApp
  class Application < Sinatra::Base
    index = lambda do
      haml :index
    end

    fourohfour = lambda do
      status 404
      haml :fourohfour
    end

    # routes
    get '/', &index
    get '/*', &index

    helpers do
      # link_to helper
      #    Creates a link element like so: <a attr="val">text</a>
      #    The optional attributes hash accepts "stringable" types for both key and hash
      def link_to(text, attributes = {})
        attr_string = attributes.map { |k, v| "#{k}=\"#{v}\"" }.join(" ")
        "<a #{attr_string}>#{text}</a>"
      end
    end
  end
end

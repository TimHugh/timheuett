#!/usr/bin/env ruby

require 'sinatra/base'
require 'haml'

module MyApp
	class Application < Sinatra::Base
		enable :run

		get '/' do
			haml :index
		end

		get '/*' do
			haml :fourohfour
			status 404
		end

		helpers do
			def link_to text, attributes = {}
				attr_string = attributes.map{ |k,v| "#{k.to_s}=\"#{v.to_s}\""}.join(" ")
				return "<a #{attr_string}>#{text}</a>"
			end

		end

	end
end

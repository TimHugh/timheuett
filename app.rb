#!/usr/bin/env ruby

require 'sinatra/base'
require 'haml'

module MyApp
	class Application < Sinatra::Base
		enable :run

		# route for root
		get '/' do
			haml :index
		end

		# anything else gets sent to 404
		get '/*' do
			haml :fourohfour
			status 404
		end

		helpers do
			# link_to helper
			#		Creates a link element like so: <a>text</a>
			#		The optional attributes hash accepts "stringable" types for both key and hash
			def link_to text, attributes = {}
				# parse attributes (if there are any) into a string
				attr_string = attributes.map{ |k,v| "#{k.to_s}=\"#{v.to_s}\""}.join(" ")
				# put HTML string together and return
				return "<a #{attr_string}>#{text}</a>"
			end

		end

	end
end

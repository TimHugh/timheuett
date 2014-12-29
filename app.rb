#!/usr/bin/env ruby

require 'sinatra'

enable :run


get '/' do
	erb :index
end

helpers do
	def link_to href, text, attributes = {}
		attr_string = attributes.map{ |k,v| "#{k.to_s}=\"#{v.to_s}\""}.join(" ")
		return "<a href=\"#{href}\" #{attr_string}>#{text}</a>"
	end
end
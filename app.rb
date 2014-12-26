#!/usr/bin/env ruby

require 'sinatra'

enable :run


get '/' do
	erb :index, :layout => :layout
end

get '/haml' do
	haml '%div.title Hello'
end

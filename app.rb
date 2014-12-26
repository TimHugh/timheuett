#!/usr/bin/env ruby

require 'sinatra'
require 'haml'

enable :run


get '/' do
	erb :index
end

get '/haml' do
	haml :index
end

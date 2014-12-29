#!/usr/bin/env ruby

require 'sinatra'

enable :run


get '/' do
	erb :index
end


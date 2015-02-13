desc "Start a console inside the app environment"
task :console do
	require 'irb'
	require 'irb/completion'
	require './app.rb'

	ARGV.clear
	IRB.start
end

desc "Ping server to keep dyno alive"
task :keepalive do
	require "net/http"

	if ENV['PING_URL']
		uri = URI(ENV['PING_URL'])
		Net::HTTP.get_response(uri)
	end
end




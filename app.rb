#!/usr/bin/env ruby

require 'sinatra/base'
require 'haml'

module MyApp
	class Application < Sinatra::Base
		enable :run

		get '/' do
			haml :index
		end

		helpers do
			def link_to href, text, attributes = {}
				attr_string = attributes.map{ |k,v| "#{k.to_s}=\"#{v.to_s}\""}.join(" ")
				return "<a href=\"#{href}\" #{attr_string}>#{text}</a>"
			end

			def GA_code
				"<script>
				(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
				(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
				m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
				})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
				ga('create', 'UA-54742901-1', 'example.com');
				ga('require', 'displayfeatures');
				ga('require', 'linkid', 'linkid.js');
				ga('send', 'pageview');
				</script>"
			end
		end

	end
end

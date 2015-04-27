task default: 'test'

unless ENV['RACK_ENV'] == 'production'
  require 'dotenv/tasks'
  require 'irb'
  require 'irb/completion'
end
require 'rake/sprocketstask'
require 'rake/testtask'
require 'logger'

Dir['./config/*.rb'].each { |file| require file }
require './app.rb'

# setup logging
logger = Logger.new('logs/test.log')
logger.level = Logger::INFO

# run tests
Rake::TestTask.new(:test => :dotenv) do |t|
  t.verbose = true if ARGV.include? "-v"
  t.libs << "."
  t.libs << "test"
  t.pattern = "test/**/*_test.rb"
end

# compile assets
namespace :assets do
  Rake::SprocketsTask.new(:precompile) do |t|
    t.environment = Site::Assets.environment Site::Application.settings.root
    t.output = './public/assets'
    t.assets = %w( application.js application.css )
  end
end

# console task
desc "Start a console inside the app environment"
task :console do
  ARGV.clear
  IRB.start
end

# keepalive for heroku server
desc "Ping server to keep dyno alive"
task :keepalive do
  require "net/http"

  logger.info "Running rake task :keepalive."

  if ENV['PING_URL']
    logger.info "\tPinging #{ENV['PING_URL']}."
    uri = URI(ENV['PING_URL'])
    if Net::HTTP.get_response(uri)
      logger.info "\t\tSuccess!"
    else
      logger.info "\t\tNo response."
    end
  else
    logger.warn "\tENV['PING_URL'] is not set."
  end
end

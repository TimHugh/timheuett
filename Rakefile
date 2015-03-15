task default: 'test'

# setup logging
require 'logger'
logger = Logger.new(STDOUT)
logger.level = Logger::INFO

# run tests
require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << "spec"
  t.pattern = "spec/**/*_spec.rb"
end

# console task
desc "Start a console inside the app environment"
task :console do
  require 'irb'
  require 'irb/completion'
  require './app.rb'

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

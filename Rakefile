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

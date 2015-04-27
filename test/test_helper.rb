require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require 'pry'

require 'app'

class Test < MiniTest::Test
  include Rack::Test::Methods

  def app
    Site::Application
  end
end

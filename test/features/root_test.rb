require 'test_helper'

class RootTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    Site::Application
  end

  def test_root_loads_and_has_content
    get '/'
    assert last_response.ok?
    assert_match /Tim Heuett/, last_response.body
  end
end

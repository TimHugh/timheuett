require 'test_helper'

class RootTest < Test
  def test_root_loads_and_has_content
    get '/'
    assert last_response.ok?
    assert_match /Tim Heuett/, last_response.body
    assert_match /info@timheuett.com/, last_response.body
  end
end

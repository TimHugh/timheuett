require 'test_helper'

class RootTest < Test
  def test_root_load_and_has_content
    get '/'
    assert last_response.ok?
    assert_match /Tim Heuett/, last_response.body
    assert_match /info@timheuett.com/, last_response.body
  end

  def test_miss_returns_404
    get '/whatever'
    assert last_response.not_found?
  end
end

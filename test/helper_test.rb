require 'minitest/autorun'

if ENV["GEM"].to_s.include?('ad')
  require 'action_dispatch'
end
if ENV["GEM"].to_s.include?('ac')
  require 'action_controller'
  require 'action_controller/test_case'
end

require 'rack/response'
require 'rack-link_headers'

class HelperTest < MiniTest::Unit::TestCase
  def setup
    @response = Rack::Response.new
  end

  def test_link_writes_header
    @response.link "search", "http://google.com/path?query=5#frag"

    assert_equal "<http://google.com/path?query=5#frag> rel=\"search\"", @response.headers["Link"]
  end

  def test_multiple_link_writes_header
    @response.link "search", "http://google.com/path?query=5#frag"
    @response.link "rss", "http://test.host/feed.rss"

    assert_equal "<http://google.com/path?query=5#frag> rel=\"search\", <http://test.host/feed.rss> rel=\"rss\"", @response.headers["Link"]
  end

  def test_links
    @response.link "search", "http://google.com/path?query=5#frag"
    @response.link "rss", "http://test.host/feed.rss"

    assert_equal @response.links, [{:rel=>"search", :url=> "http://google.com/path?query=5#frag"}, {:rel=>"rss", :url=>"http://test.host/feed.rss"}]
  end

  def test_overrides_manual_headers
    @response.headers["Link"] = "http://abc.de/"

    assert_equal "http://abc.de/", @response.headers["Link"]

    @response.link "search", "http://google.com/path?query=5#frag"

    assert_equal "<http://google.com/path?query=5#frag> rel=\"search\"", @response.headers["Link"]
  end

  if ENV["GEM"].to_s.include?('ad')
    def test_dyn_inject_action_dispatch_response
      assert ActionDispatch::Response.new.respond_to? :link
    end
  end

  if ENV["GEM"].to_s.include?('ac')
    def test_dyn_inject_action_controller_test_response
      assert ActionController::TestResponse.new.respond_to? :link
    end
  end
end

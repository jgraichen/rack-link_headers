require 'minitest/autorun'

require 'rack/response'
require 'rack-link_headers'

class HeaderHashHelperTest < MiniTest::Unit::TestCase
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
end

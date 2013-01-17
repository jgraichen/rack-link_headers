require 'minitest/autorun'

require 'rack/utils'
require 'rack-link_headers'

class HeaderHashHelperTest < MiniTest::Unit::TestCase
  def setup
    @headers = Rack::Utils::HeaderHash.new
  end

  def test_link_writes_header
    @headers.link "search", "http://google.com/path?query=5#frag"

    assert_equal "<http://google.com/path?query=5#frag> rel=\"search\"", @headers["Link"]
  end

  def test_multiple_link_writes_header
    @headers.link "search", "http://google.com/path?query=5#frag"
    @headers.link "rss", "http://test.host/feed.rss"

    assert_equal "<http://google.com/path?query=5#frag> rel=\"search\", <http://test.host/feed.rss> rel=\"rss\"", @headers["Link"]
  end

  def test_links
    @headers.link "search", "http://google.com/path?query=5#frag"
    @headers.link "rss", "http://test.host/feed.rss"

    assert_equal @headers.links, [{:rel=>"search", :url=> "http://google.com/path?query=5#frag"}, {:rel=>"rss", :url=>"http://test.host/feed.rss"}]
  end

  def test_overrides_manual_headers
    @headers["Link"] = "http://abc.de/"

    assert_equal "http://abc.de/", @headers["Link"]

    @headers.link "search", "http://google.com/path?query=5#frag"

    assert_equal "<http://google.com/path?query=5#frag> rel=\"search\"", @headers["Link"]
  end
end

# frozen_string_literal: true

require 'minitest/autorun'

ACTIONPACK = !ENV['ACTIONPACK'].to_s.empty?

if ACTIONPACK
  # For testing ActionDispatch::Response
  require 'action_dispatch'
end

require 'rack-link_headers'

class HelperTest < Minitest::Test
  def setup
    @response = Rack::Response.new
  end

  def test_link_writes_header
    @response.link 'http://google.com/path?query=5#frag', rel: :search

    assert_equal '<http://google.com/path?query=5#frag>; rel="search"', @response.headers['Link']
  end

  def test_multiple_link_writes_header
    @response.link 'http://google.com/path?query=5#frag', rel: :search
    @response.link 'http://test.host/feed.rss', rel: :rss, type: 'application/rss+xml'

    assert_equal '<http://google.com/path?query=5#frag>; rel="search", <http://test.host/feed.rss>; rel="rss"; type="application/rss+xml"',
      @response.headers['Link']
  end

  def test_links
    @response.link 'http://google.com/path?query=5#frag', rel: :search
    @response.link 'http://test.host/feed.rss', rel: :rss, type: 'application/rss+xml'

    assert_equal @response.links, [
      {url: 'http://google.com/path?query=5#frag', params: {rel: :search}},
      {url: 'http://test.host/feed.rss', params: {rel: :rss, type: 'application/rss+xml'}},
    ]
  end

  def test_overrides_manual_headers
    @response.headers['Link'] = 'http://abc.de/'

    assert_equal 'http://abc.de/', @response.headers['Link']

    @response.link 'http://google.com/path?query=5#frag', rel: :search

    assert_equal '<http://google.com/path?query=5#frag>; rel="search"', @response.headers['Link']
  end

  if ACTIONPACK
    def test_dyn_inject_action_dispatch_response
      assert ActionDispatch::Response.new.respond_to? :link
    end
  end
end

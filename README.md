# Rack::LinkHeaders

Easy Link header management for rack responses.

## Installation

Add this line to your application's Gemfile:

    gem 'rack-link_headers'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-link_headers

## Usage

```ruby
response.headers.link "rel", "http://abc.de/"
response.headers.link "rss", "http://test.host/feed.xml"
```
```
Link: <http://abc.de/> rel="rel", <http://test.host/feed.xml> rel="rss"
```

Manual set Link header will be overridden. All links can be
accessed via `links`:

```ruby
response.headers.link "rel", "http://abc.de/"
response.headers.link "rss", "http://test.host/feed.xml"

response.headers.links
# => [{:rel=>"rel", :url=>"http://abc.de/"}, {:rel=>"rss", :url=>"http://test.host/feed.xml"}]
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Add tests for your features.
4. Add your features.
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create new Pull Request

## License

[MIT License](http://www.opensource.org/licenses/mit-license.php)

Copyright (c) 2013, Jan Graichen

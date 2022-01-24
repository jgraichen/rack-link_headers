# Rack::LinkHeaders

[![Gem Version](https://img.shields.io/gem/v/rack-link_headers?logo=ruby)](https://rubygems.org/gems/rack-link_headers)
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/jgraichen/rack-link_headers/test?logo=github)](https://github.com/jgraichen/rack-link_headers/actions?query=branch%3Amain)

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
response.link "http://abc.de/", rel: :search
response.link "http://test.host/feed.xml", rel: :rss, type: "application/rss+xml"
```
```
response.headers["Link"]
# => <http://abc.de/>; rel="rel", <http://test.host/feed.xml>; rel="rss"; type="application/rss+xml"
```

Manual set Link header will be overridden. All links can be
accessed via `links`:

```ruby
response.link "http://abc.de/", rel: :search
response.link "http://test.host/feed.xml", rel: :rss, type: "application/rss+xml"

response.links
# => [
#  {:url=>"http://abc.de/",
#   :params=>{:ref=>:search}},
#  {:url=>"http://test.host/feed.xml",
#   :params=>{:rel=>:rss, :type=>"application/rss+xml"}}
# ]
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

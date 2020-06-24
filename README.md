# DefraRubyFeatures
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'defra-ruby-features'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install defra-ruby-features
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).







# Defra Ruby Features

[![Build Status](https://travis-ci.com/DEFRA/defra-ruby-mocks.svg?branch=master)](https://travis-ci.com/DEFRA/defra-ruby-features)
[![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=DEFRA_defra-ruby-features&metric=sqale_rating)](https://sonarcloud.io/dashboard?id=DEFRA_defra-ruby-features)
[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=DEFRA_defra-ruby-features&metric=coverage)](https://sonarcloud.io/dashboard?id=DEFRA_defra-ruby-features)
[![security](https://hakiri.io/github/DEFRA/defra-ruby-features/master.svg)](https://hakiri.io/github/DEFRA/defra-ruby-features/master)
[![Licence](https://img.shields.io/badge/Licence-OGLv3-blue.svg)](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3)

A Rails Engine used by the [Ruby services team](https://github.com/DEFRA/ruby-services-team) in their digital services.

We use it to set, update and delete feature toggles on our rails services.

When mounted in an app, it will add additional endpoints to manage feature toggles.

Things to note

- We have gone with an engine rather than an additional service, to simplify management of feature toggles in our environments

## Prerequisites

Make sure you already have:

- Ruby 2.7.1
- [Bundler](http://bundler.io/) – for installing Ruby gems

## Mounting the engine

Add the engine to your Gemfile:

```ruby
gem "defra_ruby_features",
    git: "https://github.com/DEFRA/defra-ruby-features"
```

Install it with `bundle install`.

Then mount the engine in your routes.rb file:

```ruby
Rails.application.routes.draw do
  mount DefraRubyMocks::Engine => "/defra-ruby-featuress"
end
```

The engine should now be mounted at `/defra-ruby-features` of your project. You can change `"/defra-ruby-features"` to a different route if you'd prefer it to be elsewhere.

## Configuration

For the feature toggles routes to be accessible you'll also need to configure them.

```ruby
# config/initializers/defra_ruby_features.rb
require "defra_ruby_features"

DefraRubyFeatures.configure do |config|
  config.feature_toggle_model = FeatureToggle
end
```








## Installation

You don't need to do this if you're just mounting the engine without making any changes.

However, if you want to edit the engine, you'll have to install it locally.

Clone the repo and drop into the project:

```bash
git clone https://github.com/DEFRA/defra-ruby-mocks.git && cd defra-ruby-mocks
```

Then install the dependencies with `bundle install`.

## Testing the engine

The engine is mounted in a dummy Rails 4 app (in /spec/dummy) so we can properly test its behaviour.

The test suite is written in RSpec.

To run all the tests, use `bundle exec rspec`.

## Contributing to this project

If you have an idea you'd like to contribute please log an issue.

All contributions should be submitted via a pull request.

## License

THIS INFORMATION IS LICENSED UNDER THE CONDITIONS OF THE OPEN GOVERNMENT LICENCE found at:

<http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3>

The following attribution statement MUST be cited in your products and applications when using this information.

> Contains public sector information licensed under the Open Government license v3

### About the license

The Open Government Licence (OGL) was developed by the Controller of Her Majesty's Stationery Office (HMSO) to enable information providers in the public sector to license the use and re-use of their information under a common open licence.

It is designed to encourage use and re-use of information freely and flexibly, with only a few conditions.

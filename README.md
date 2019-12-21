# Coolkit

[![Gem](https://img.shields.io/gem/v/coolkit)](https://rubygems.org/gems/coolkit)
[![Build Status](https://travis-ci.org/tcd/coolkit.svg?branch=master)](https://travis-ci.org/tcd/coolkit)
[![Coverage Status](https://coveralls.io/repos/github/tcd/coolkit/badge.svg?branch=master)](https://coveralls.io/github/tcd/coolkit?branch=master)
[![GitHub](https://img.shields.io/github/license/tcd/coolkit)](https://github.com/tcd/coolkit/blob/master/LICENSE.txt)
[![Documentation](http://img.shields.io/badge/docs-rubydoc.org-blue.svg)](https://www.rubydoc.info/gems/coolkit)

Useful ruby code with no dependencies.

## Installation

Add `gem "coolkit"` to your application's Gemfile and then run `bundle`.

Or install it yourself as `gem install coolkit`

## Usage

If you want to use one of the core extensions, it needs to be required explicitly.
This allows users to make use of `coolkit`'s general functions without monkeypatching the standard library.

```ruby
require "coolkit"

hash = {"key" => [{"k" => :v}, {"k" => 5}]}
Coolkit.symbolize_keys(hash) #=> {:key => [{:k => :v}, {:k => 5}]}

```

### Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tcd/coolkit.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

# DateFromParams

Gem provides functionality for fetching date/datetime from rails like view helpers such as date_select, datetime_select, select_date and select_datetime.

## Installation

Add this line to your application's Gemfile:

    gem 'date_from_params'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install date_from_params

## Usage

Simple example:
```ruby
irb(main):001:0> params
=> {"finished_at(1i)"=>"2010", "finished_at(2i)"=>"2", "finished_at(3i)"=>"3"}
irb(main):002:0> DateFromParams.date_from_date_select(:finished_at, params)
=> Wed, 03 Feb 2010
```

Also, if you use this gem in rails app, you can do something like this:

```ruby
class OrdersController < ApplicationController
  include DateFromParams

  def index
    from_time = date_from_date_select(:from_time)
    @orders = Order.from(from_time)
  end
end

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

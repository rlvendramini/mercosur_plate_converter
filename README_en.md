# MercosurPlateConverter

[PORTUGUESE 🇧🇷](README.md)

With this GEM you can validate and convert Brazilian plates from the old model to the new model used by Mercosul (and vice-versa).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mercosur_plate_converter'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install mercosur_plate_converter

## Usage

Instantiate MercosurPlateConverter class and use the methods to validate and convert plates.

The example below assumes that you supply a valid Mercosur-type license plate:

```ruby
plate = MercosurPlateConverter::Converter.from_string("ABC1C34")

plate.original_plate #=> "ABC1334"
plate.plate #=> "ABC1234"
plate.type #=> :mercosur
plate.valid? #=> true
plate.mercosur? #=> true
plate.old_brazilian? #=> false
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mercosur_plate_converter.

[![Gem Version](https://badge.fury.io/rb/mercosur_plate_converter.svg)](https://badge.fury.io/rb/mercosur_plate_converter)
[![Ruby](https://github.com/rlvendramini/mercosur_plate_converter/actions/workflows/ruby.yml/badge.svg)](https://github.com/rlvendramini/mercosur_plate_converter/actions/workflows/ruby.yml)
[![CodeQL](https://github.com/rlvendramini/mercosur_plate_converter/actions/workflows/codeql.yml/badge.svg)](https://github.com/rlvendramini/mercosur_plate_converter/actions/workflows/codeql.yml)

# MercosurPlateConverter

[PORTUGUESE 🇧🇷](README.md)

With this GEM you can validate and convert Brazilian plates from the old model to the new model used by Mercosul (and vice-versa).

The numbering standard for Brazilian vehicle license plates is the old model.
The mercosur vehicle license plate numbering standard is the new model.

The Mercosur standard is composed of 3 letters, 1 number, 1 letter and 2 numbers.
To convert from the old model to the new one, it is necessary that the number be converted to the equivalent letter.
This conversion is done from a sequence, as in an `Array`, where each element is a letter from A to J according to the index of that `Array`.

So, for example:

|Number|Letter|
|-----|------|
|0|A|
|1|B|
|2|C|
|3|D|
|4|E|
|5|F|
|6|G|
|7|H|
|8|I|
|9|J|

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
plate = MercosurPlateConverter.from_string("ABC1C34")

plate.original_plate #=> "ABC1C34"
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

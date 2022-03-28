# MercosurPlateConverter

[ENGLISH 🇺🇸🇬🇧](README_en.md)

A motivação por trás dessa GEM é validar e converter placas de veículos brasileiros do antigo modelo para o novo modelo adotado pelo Mercosul (e vice-versa).

## Installation

Insira a linha abaixo em seu Gemfile:

```ruby
gem 'mercosur_plate_converter'
```

E então execute no terminal:

    $ bundle install

Ou instale manualmente, também via terminal:

    $ gem install mercosur_plate_converter

## Usage

Crie uma instância da classe MercosurPlateConverter e use os métodos para validar e converter placas.

O exemplo abaixo considera que você fornece uma placa válida do tipo Mercosul:

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

Após verificar o repositório, execute `bin/setup` para instalar as dependências. Em seguida, execute `rake spec` para executar os testes. Você também pode executar `bin/console` para um prompt interativo que permitirá que você experimente.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Relatórios de bugs e pull requests são bem-vindos no GitHub em https://github.com/[USERNAME]/mercosur_plate_converter.

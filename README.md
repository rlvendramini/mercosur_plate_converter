# MercosurPlateConverter

[![Gem Version](https://badge.fury.io/rb/mercosur_plate_converter.svg)](https://badge.fury.io/rb/mercosur_plate_converter)
[![Ruby](https://github.com/rlvendramini/mercosur_plate_converter/actions/workflows/ruby.yml/badge.svg)](https://github.com/rlvendramini/mercosur_plate_converter/actions/workflows/ruby.yml)
[![CodeQL](https://github.com/rlvendramini/mercosur_plate_converter/actions/workflows/codeql.yml/badge.svg)](https://github.com/rlvendramini/mercosur_plate_converter/actions/workflows/codeql.yml)

[ENGLISH 🇺🇸🇬🇧](README_en.md)

A motivação por trás dessa gem é validar e converter placas de veículos brasileiros do antigo modelo para o novo modelo adotado pelo Mercosul (e vice-versa).

O padrão de numeração das placas de veículos brasileiros é o antigo modelo.
O padrão de numeração das placas de veículos Mercosul é o novo modelo.

O padrão Mercosul é composto por 3 letras, 1 número, 1 letra e 2 números.
Para fazer a conversão do modelo antigo para o novo, é necessário que o número seja convertido para a letra equivalente.
Essa conversão é feita a partir de uma sequência, como em um `Array`, onde cada elemento é uma letra de A a J de acordo com o índice desse `Array`.

Assim sendo:

| Número | Letra |
| ------ | ----- |
| 0      | A     |
| 1      | B     |
| 2      | C     |
| 3      | D     |
| 4      | E     |
| 5      | F     |
| 6      | G     |
| 7      | H     |
| 8      | I     |
| 9      | J     |

## Instalação

Insira a linha abaixo em seu Gemfile:

```ruby
gem 'mercosur_plate_converter'
```

E então execute no terminal:

```sh
bundle install
```

Ou instale manualmente, também via terminal:

```sh
gem install mercosur_plate_converter
```

## Uso

Crie uma instância da classe MercosurPlateConverter e use os métodos para validar e converter placas.

O exemplo abaixo considera que você fornece uma placa válida do tipo Mercosul:

```ruby
plate = MercosurPlateConverter.from_string("ABC1C34")

plate.original_plate #=> "ABC1C34"
plate.plate #=> "ABC1234"
plate.type #=> :mercosur
plate.valid? #=> true
plate.mercosur? #=> true
plate.old_brazilian? #=> false
```

## Desenvolvimento

Após verificar o repositório, execute `bin/setup` para instalar as dependências. Em seguida, execute `rake spec` para executar os testes. Você também pode executar `bin/console` para um prompt interativo que permitirá que você experimente.

Para instalar esta gem localmente, execute `bundle exec rake install`. Para lançar uma nova versão, atualize o número da versão em `version.rb` e execute `bundle exec rake release`, que criará uma tag git para a versão, enviará os commits e a tag criada, e publicará o arquivo `.gem` no [rubygems.org](https://rubygems.org).

## Como contribuir?

Relatórios de bugs e pull requests são bem-vindos no GitHub em [github.com/rlvendramini/mercosur_plate_converter](https://github.com/rlvendramini/mercosur_plate_converter).

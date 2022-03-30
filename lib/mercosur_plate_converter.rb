# frozen_string_literal: true

require_relative "mercosur_plate_converter/version"
require_relative "mercosur_plate_converter/converter"
require_relative "mercosur_plate_converter/errors"

# MercoSurPlateConverter is a gem that converts Mercosur plates to Brazilian plates and vice versa.
# you can call it like this: MercosurPlateConverter.from_string("ABC1C34")
module MercosurPlateConverter
  def self.from_string(plate)
    Converter.new(plate)
  end
end

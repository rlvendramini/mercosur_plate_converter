# frozen_string_literal: true

module MercosurPlateConverter
  # MercosurPlateConverter::Converter.new("ABC1C34") where "ABC1C34" is the vehicle's plate.
  class Converter
    FIFTH_TERM_MAP = ("A".."J").to_a.freeze

    attr_reader :original_plate, :type, :plate

    def initialize(plate)
      @original_plate = sanitize_plate(plate)
      @plate = @original_plate.dup
      @type = nil

      validate_plate
      detect_type
      convert
    end

    def convert
      send("convert_from_#{type}")
    end

    def valid?
      mercosur? || old_brazilian?
    end

    def mercosur?
      @original_plate.match?(/^(BR\s?)?[A-Z]{3}[0-9]{1}[A-Z]{1}[0-9]{2}$/)
    end

    def old_brazilian?
      @original_plate.match?(/^[A-Z]{3}[0-9]{4}$/)
    end

    private

    def convert_from_old_brazilian
      return @plate if @type == :mercosur

      @plate[4] = FIFTH_TERM_MAP[@plate[4].to_i]
      @plate
    end

    def convert_from_mercosur
      return @plate if @type == :old_brazilian

      @plate = @plate.gsub(/^(BR\s?)?/, "")
      @plate[4] = FIFTH_TERM_MAP.index(@plate[4]).to_s
      @plate
    end

    def detect_type
      @type = if mercosur?
                :mercosur
              elsif old_brazilian?
                :old_brazilian
              end
    end

    def sanitize_plate(plate)
      return unless plate

      plate.to_s.upcase.gsub(/[^0-9A-Z]/, "")
    end

    def validate_plate
      raise MissingPlateError, "Missing plate" if @plate.nil?
      raise InvalidPlateError, "Invalid plate #{@plate}" unless valid?
    end
  end
end

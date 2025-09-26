# frozen_string_literal: true

module MercosurPlateConverter
  # MercosurPlateConverter::Converter.new("ABC1C34") where "ABC1C34" is the vehicle's plate.
  class Converter
    # Pre-computed mapping for better performance
    FIFTH_TERM_MAP = %w[A B C D E F G H I J].freeze
    MERCOSUR_REGEX = /\A(BR\s?)?[A-Z]{3}[0-9][A-Z][0-9]{2}\z/
    OLD_BRAZILIAN_REGEX = /\A[A-Z]{3}[0-9]{4}\z/

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
      case @type
      when :mercosur
        convert_from_mercosur
      when :old_brazilian
        convert_from_old_brazilian
      else
        @plate
      end
    end

    def valid?
      mercosur? || old_brazilian?
    end

    def mercosur?
      @original_plate.match?(MERCOSUR_REGEX)
    end

    def old_brazilian?
      @original_plate.match?(OLD_BRAZILIAN_REGEX)
    end

    private

    def convert_from_old_brazilian
      return @plate if @type == :mercosur

      # Convert 5th position from number to letter
      digit = @plate[4].to_i
      @plate[4] = FIFTH_TERM_MAP[digit] if digit < FIFTH_TERM_MAP.size
      @plate
    end

    def convert_from_mercosur
      return @plate if @type == :old_brazilian

      # Remove BR prefix and convert 5th position from letter to number
      @plate = @plate.gsub(/\A(BR\s?)?/, "")
      letter_index = FIFTH_TERM_MAP.index(@plate[4])
      @plate[4] = letter_index.to_s if letter_index
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

      # More efficient string cleaning using delete
      plate.to_s.upcase.delete("^A-Z0-9")
    end

    def validate_plate
      raise MissingPlateError, "Missing plate" if @plate.nil? || @plate.empty?
      raise InvalidPlateError, "Invalid plate #{@plate}" unless valid?
    end
  end
end

# frozen_string_literal: true

module MercosurPlateConverter
  # MercosurPlateConverter::Converter.new("ABC1C34") where "ABC1C34" is the vehicle's plate.
  class Converter
    # Pre-computed mapping for better performance
    FIFTH_TERM_MAP = %w[A B C D E F G H I J].freeze
    FIFTH_TERM_MAP_REVERSE = FIFTH_TERM_MAP.each_with_index.to_h.freeze
    private_constant :FIFTH_TERM_MAP_REVERSE

    MERCOSUR_REGEX = /\A(BR\s?)?[A-Z]{3}[0-9][A-Z][0-9]{2}\z/
    LEGACY_REGEX = /\A[A-Z]{3}[0-9]{4}\z/

    attr_reader :original_plate, :type, :plate

    def initialize(plate)
      @original_plate = sanitize_plate(plate)
      @plate = @original_plate.dup

      validate_plate_presence
      detect_type
      validate_plate_format
      convert
    end

    def valid?
      !@type.nil?
    end

    def mercosur?
      @type == :mercosur
    end

    def legacy?
      @type == :legacy
    end

    def old_brazilian?
      warn "[DEPRECATION] `old_brazilian?` is deprecated. Use `legacy?` instead."
      legacy?
    end

    private

    def convert
      case @type
      when :mercosur
        convert_from_mercosur
      when :legacy
        convert_from_legacy
      else
        @plate
      end
    end

    def convert_from_legacy
      # Convert 5th position from number to letter
      digit = @plate[4].to_i
      @plate[4] = FIFTH_TERM_MAP[digit] if digit < FIFTH_TERM_MAP.size
      @plate
    end

    def convert_from_mercosur
      # Remove optional BR prefix and convert 5th position from letter to number
      @plate = @plate.delete_prefix("BR")
      letter_index = FIFTH_TERM_MAP_REVERSE[@plate[4]]
      @plate[4] = letter_index.to_s if letter_index
      @plate
    end

    def detect_type
      @type = if @original_plate.match?(MERCOSUR_REGEX)
                :mercosur
              elsif @original_plate.match?(LEGACY_REGEX)
                :legacy
              end
    end

    def sanitize_plate(plate)
      return unless plate

      plate.to_s.upcase.delete("^A-Z0-9")
    end

    def validate_plate_presence
      raise MissingPlateError, "Missing plate" if @plate.nil? || @plate.empty?
    end

    def validate_plate_format
      raise InvalidPlateError, "Invalid plate #{@plate}" unless @type
    end
  end
end

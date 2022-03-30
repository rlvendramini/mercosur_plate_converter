# frozen_string_literal: true

RSpec.describe MercosurPlateConverter do
  it "has a version number" do
    expect(MercosurPlateConverter::VERSION).not_to be nil
  end

  subject { described_class.from_string("ABC1C34") }

  it "instantiates a new Converter" do
    expect(subject).to be_a(MercosurPlateConverter::Converter)
  end
end

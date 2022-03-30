# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
RSpec.describe MercosurPlateConverter::Converter do
  subject { described_class.new(plate) }

  context "when converting from Mercosur plate to Brazilian plate" do
    context "with a valid Mercosur plate" do
      let(:plate) { "ABC1C34" }

      it "converts correctly" do
        expect(subject.plate).to eq("ABC1234")
      end

      it "is valid" do
        expect(subject.valid?).to be_truthy
      end

      it "has the correct type" do
        expect(subject.type).to eq(:mercosur)
      end

      it "has the correct original plate" do
        expect(subject.original_plate).to eq(plate)
      end

      it "is mercosur?" do
        expect(subject.mercosur?).to be_truthy
      end

      it "isn't old_brazilian?" do
        expect(subject.old_brazilian?).to be_falsey
      end
    end

    context "with an invalid Mercosur plate" do
      let(:plate) { "ABC1C3" }

      it "raises an error" do
        expect { subject }.to raise_error(MercosurPlateConverter::InvalidPlateError)
      end
    end

    context "with missing Mercosur plate" do
      let(:plate) { nil }

      it "raises an error" do
        expect { subject }.to raise_error(MercosurPlateConverter::MissingPlateError)
      end
    end
  end

  context "when converting from Brazilian plate to Mercosur plate" do
    context "with a valid Brazilian plate" do
      let(:plate) { "ABC1234" }

      it "converts correctly" do
        expect(subject.plate).to eq("ABC1C34")
      end

      it "is valid" do
        expect(subject.valid?).to be_truthy
      end

      it "has the correct type" do
        expect(subject.type).to eq(:old_brazilian)
      end

      it "has the correct original plate" do
        expect(subject.original_plate).to eq(plate)
      end

      it "is old_brazilian?" do
        expect(subject.old_brazilian?).to be_truthy
      end

      it "isn't mercosur?" do
        expect(subject.mercosur?).to be_falsey
      end
    end

    context "with an invalid Brazilian plate" do
      let(:plate) { "ABC123" }

      it "raises an error" do
        expect { subject }.to raise_error(MercosurPlateConverter::InvalidPlateError)
      end
    end

    context "with missing Brazilian plate" do
      let(:plate) { nil }

      it "raises an error" do
        expect { subject }.to raise_error(MercosurPlateConverter::MissingPlateError)
      end
    end
  end

  context "when converting from dirty strings" do
    context "spaced strings" do
      let(:plate) { "ABC 1C34" }

      it "converts correctly" do
        expect(subject.plate).to eq("ABC1234")
      end
    end

    context "stripey strings" do
      let(:plate) { "ABC-1C34" }

      it "converts correctly" do
        expect(subject.plate).to eq("ABC1234")
      end
    end

    context "full mercosur pattern strings" do
      let(:plate) { "BR ABC 1C34" }

      it "converts correctly" do
        expect(subject.plate).to eq("ABC1234")
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength

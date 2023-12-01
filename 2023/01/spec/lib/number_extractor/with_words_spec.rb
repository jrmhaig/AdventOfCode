require 'number_extractor/with_words'

RSpec.describe NumberExtractor::WithWords do
  describe '.split' do
    subject { described_class.split(text) }

    context 'with no spelt out numbers' do
      let(:text) { '0a1b2c3d4f5' }

      it { is_expected.to eq([0, 1, 2, 3, 4, 5]) }
    end

    context 'with spelt out numbers' do
      let(:text) { '0a1nine2c3dsevenx4f5' }

      it { is_expected.to eq([0, 1, 9, 2, 3, 7, 4, 5]) }
    end

    context 'with overlapping words' do
      let(:text) { 'eightwo' }

      it { is_expected.to eq([8, 2]) }
    end
  end
end

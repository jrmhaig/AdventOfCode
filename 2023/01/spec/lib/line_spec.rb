require 'line'
require 'number_extractor/just_numbers'

RSpec.describe Line do
  subject(:line) { described_class.new(text, extractor: NumberExtractor::JustNumbers) }

  let(:text) { 'abc123' }

  before do
    allow(NumberExtractor::JustNumbers).to receive(:split).with(text).and_return(numbers)
  end

  describe '#calibration_value' do
    subject { line.calibration_value }

    context 'with exactly two digits' do
      let(:numbers) { [5, 4] }

      it { is_expected.to eq 54 }
    end

    context 'with more than two digits' do
      let(:numbers) { [5, 8, 3, 2, 4] }

      it { is_expected.to eq 54 }
    end

    context 'with a single digit' do
      let(:numbers) { [9] }

      it { is_expected.to eq 99 }
    end
  end
end

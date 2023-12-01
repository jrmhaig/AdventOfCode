require 'line'

RSpec.describe Line do
  subject(:line) { described_class.new(text) }

  let(:text) { 'abc123' }

  describe '#calibration_value' do
    subject { line.calibration_value }

    context 'with a digit at the beginning and end' do
      let(:text) { '2a5b9c3' }

      it { is_expected.to eq 23 }
    end

    context 'with digits embedded in the line' do
      let(:text) { 'x2a5b5c3yz' }

      it { is_expected.to eq 23 }
    end

    context 'with a single digit' do
      let(:text) { 'abc7def' }

      it { is_expected.to eq 77 }
    end
  end
end

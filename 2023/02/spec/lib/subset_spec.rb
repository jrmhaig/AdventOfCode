require 'subset'

RSpec.describe Subset do
  subject(:subset) { described_class.new(input) }

  let(:input) { '3 blue, 2 green, 5 red' }

  describe '#red' do
    subject { subset.red }

    it { is_expected.to eq 5 }

    context 'with only red' do
      let(:input) { '7 red' }

      it { is_expected.to eq 7 }
    end

    context 'with no red' do
      let(:input) { '9 blue, 11 green' }

      it { is_expected.to eq 0 }
    end
  end

  describe '#green' do
    subject { subset.green }

    it { is_expected.to eq 2 }

    context 'with only green' do
      let(:input) { '7 green' }

      it { is_expected.to eq 7 }
    end

    context 'with no green' do
      let(:input) { '9 blue, 11 red' }

      it { is_expected.to eq 0 }
    end
  end

  describe '#blue' do
    subject { subset.blue }

    it { is_expected.to eq 3 }

    context 'with only blue' do
      let(:input) { '7 blue' }

      it { is_expected.to eq 7 }
    end

    context 'with no blue' do
      let(:input) { '9 red, 11 green' }

      it { is_expected.to eq 0 }
    end
  end
end

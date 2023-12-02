require 'game'
require 'validator'
require 'subset'

RSpec.describe Game do
  subject(:game) { described_class.new(input, validator:) }

  let(:input) { 'Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green' }
  let(:validator) { instance_double(Validator) }

  describe '#id' do
    subject { game.id }

    it { is_expected.to eq 1 }
  end

  describe '#valid?' do
    subject(:valid) { game.valid? }

    context 'when the validator returns true' do
      before do
        allow(validator).to receive(:check)
          .and_return(true)
      end

      it do
        valid
        expect(validator).to have_received(:check)
          .with(instance_of(Subset), instance_of(Subset), instance_of(Subset))
      end

      it { is_expected.to be_truthy }
    end

    context 'when the validator returns false' do
      before do
        allow(validator).to receive(:check)
          .and_return(false)
      end

      it do
        valid
        expect(validator).to have_received(:check)
          .with(instance_of(Subset), instance_of(Subset), instance_of(Subset))
      end

      it { is_expected.to be_falsey }
    end
  end

  describe '#power' do
    subject { game.power }

    let(:input) { 'Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green' }

    it { is_expected.to eq 48 }
  end
end

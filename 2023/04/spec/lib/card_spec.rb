require 'card'

RSpec.describe Card do
  subject(:card) { described_class.new(data) }

  let(:data) { 'Card 1: 41 48 83 86 17' }

  describe '#value' do
    subject { card.value(number) }

    context 'when no winners have been found' do
      context 'when a winning number is found' do
        let(:number) { 86 }

        it { is_expected.to eq 1 }
      end

      context 'when a winning number is not found' do
        let(:number) { 87 }

        it { is_expected.to eq 0 }
      end

      context 'with no input' do
        subject { card.value }

        it { is_expected.to eq 0 }
      end
    end

    context 'when one winner have been found' do
      before { card.value(41) }

      context 'when a winning number is found' do
        let(:number) { 86 }

        it { is_expected.to eq 2 }
      end

      context 'when a winning number is not found' do
        let(:number) { 87 }

        it { is_expected.to eq 1 }
      end

      context 'with no input' do
        subject { card.value }

        it { is_expected.to eq 1 }
      end
    end

    context 'when some winners have been found' do
      before do
        card.value(41)
        card.value(48)
        card.value(83)
      end

      context 'when a winning number is found' do
        let(:number) { 86 }

        it { is_expected.to eq 4 }
      end

      context 'when a winning number is not found' do
        let(:number) { 87 }

        it { is_expected.to eq 3 }
      end

      context 'with no input' do
        subject { card.value }

        it { is_expected.to eq 3 }
      end
    end
  end

  describe '#copies' do
    subject { card.copies }

    it { is_expected.to eq 1 }
  end

  describe '#copy' do
    subject(:copy) { card.copy(3) }

    it { expect { copy }.to change(card, :copies).from(1).to(4) }
  end
end

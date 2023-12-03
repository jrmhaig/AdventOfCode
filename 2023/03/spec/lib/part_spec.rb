require 'part'

RSpec.describe Part do
  subject(:part) { described_class.new(row, above:, below:) }

  let(:above) { '.....' }
  let(:row) { '.123.' }
  let(:below) { '.....' }

  describe '#symbols' do
    subject { part.symbols }

    context 'when not on the edge' do
      context 'with no symbols' do
        it { is_expected.to be_empty }
      end

      context 'with symbols on the same row' do
        let(:row) { '*123+' }

        it { is_expected.to contain_exactly('*', '+') }
      end

      context 'with symbols on the row before and after' do
        let(:above) { '*..$.' }
        let(:below) { '.$..+' }

        it { is_expected.to contain_exactly('*', '$', '$', '+') }
      end
    end

    context 'when on the top edge' do
      let(:above) { nil }

      context 'with no symbols' do
        it { is_expected.to be_empty }
      end

      context 'with symbols on the same row' do
        let(:row) { '*123+' }

        it { is_expected.to contain_exactly('*', '+') }
      end

      context 'with symbols on the row before and after' do
        let(:below) { '.$..+' }

        it { is_expected.to contain_exactly('$', '+') }
      end
    end

    context 'when on the bottom edge' do
      let(:above) { nil }

      context 'with no symbols' do
        it { is_expected.to be_empty }
      end

      context 'with symbols on the same row' do
        let(:row) { '*123+' }

        it { is_expected.to contain_exactly('*', '+') }
      end

      context 'with symbols on the row before and after' do
        let(:above) { '*..$.' }

        it { is_expected.to contain_exactly('*', '$') }
      end
    end
  end

  describe '#number' do
    subject { part.number }

    it { is_expected.to eq 123 }
  end
end

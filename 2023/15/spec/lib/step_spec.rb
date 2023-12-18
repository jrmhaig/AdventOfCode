require 'step'

RSpec.describe Step do
  subject(:step) { described_class.new(data, hash_method:) }

  let(:hash_method) { :full }

  describe '#hash' do
    subject { step.hash }

    context 'with HASH' do
      let(:data) { 'HASH' }

      it { is_expected.to eq 52 }
    end

    context 'with full method' do
      let(:data) { 'rn=1' }

      it { is_expected.to eq 30 }
    end

    context 'with code method' do
      let(:data) { 'rn=1' }
      let(:hash_method) { :code }

      it { is_expected.to eq 0 }
    end
  end
end

require 'values'

RSpec.describe Values do
  subject(:values) { Values.new(*data) }

  describe '#next' do
    subject { values.next }

    context 'with first example' do
      let(:data) { [0, 3, 6, 9, 12, 15] }

      it { is_expected.to eq(18) }
    end

    context 'with second example' do
      let(:data) { [1, 3, 6, 10, 15, 21] }

      it { is_expected.to eq(28) }
    end

    context 'with third example' do
      let(:data) { [10, 13, 16, 21, 30, 45] }

      it { is_expected.to eq(68) }
    end
  end

  describe '#prev' do
    subject { values.prev }

    context 'with first example' do
      let(:data) { [0, 3, 6, 9, 12, 15] }

      it { is_expected.to eq(-3) }
    end

    context 'with second example' do
      let(:data) { [1, 3, 6, 10, 15, 21] }

      it { is_expected.to eq(0) }
    end

    context 'with third example' do
      let(:data) { [10, 13, 16, 21, 30, 45] }

      it { is_expected.to eq(5) }
    end
  end
end

require 'row'

RSpec.describe Row do
  subject(:row) { described_class.new(data) }

  describe '#mirrors' do
    subject { row.mirrors }

    context 'with a single mirror point between ash' do
      let(:data) { '#.#....#.' }

      it { is_expected.to contain_exactly(4) }
    end

    context 'with a single mirror point between rocks' do
      let(:data) { '.#.##.#.#' }

      it { is_expected.to contain_exactly(3) }
    end

    context 'with multiple mirror points' do
      let(:data) { '.##..##..' }

      it { is_expected.to contain_exactly(1, 3, 5, 7) }
    end

    context 'with no mirror points' do
      let(:data) { '#.#.#.#.#.' }

      it { is_expected.to be_empty }
    end
  end
end

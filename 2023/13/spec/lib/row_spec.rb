require 'row'

RSpec.describe Row do
  subject(:row) { described_class.new(data) }

  describe '#diff' do
    subject { row.diff(other) }

    let(:data) { '.##..#..' }
    let(:other) { described_class.new(other_data) }

    context 'when the rows are the same' do
      let(:other_data) { data }

      it { is_expected.to eq 0 }
    end

    context 'when the rows differ by 1' do
      let(:other_data) { '.###.#..' }

      it { is_expected.to eq 1 }
    end

    context 'when the rows differ by more than 1' do
      let(:other_data) { '...#.##.' }

      it { is_expected.to be > 1 }
    end
  end
end

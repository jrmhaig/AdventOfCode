require 'column'

RSpec.describe Column do
  subject(:column) { described_class.new(*data) }

  describe '#weight' do
    subject { column.weight }

    context 'with no rocks' do
      let(:data) { %w[O . O . O O O . . O] }

      it { is_expected.to eq 45 }
    end

    context 'with rocks' do
      let(:data) { %w[. O . . . # O . . O] }

      it { is_expected.to eq 17 }
    end

    context 'with an example' do
      let(:data) { %w[# . # . . O # . # #] }

      it { is_expected.to eq 7 }
    end

    context 'with another example' do
      let(:data) { %w[. . # . . . O . # .] }

      it { is_expected.to eq 7 }
    end
  end
end

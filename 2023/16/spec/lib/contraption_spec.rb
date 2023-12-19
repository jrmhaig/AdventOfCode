require 'contraption'
require 'beam_head'

RSpec.describe Contraption do
  subject(:contraption) { Contraption.new(*data) }

  let(:data) do
    [
      '.|...\....',
      '|.-.\.....',
      '.....|-...',
      '........|.',
      '..........',
      '.........\\',
      '..../.\\..',
      '.-.-/..|..',
      '.|....-|.\\',
      '..//.|....',
    ]
  end

  describe '#travel' do
    subject { contraption.travel(head) }

    context 'with a beam travelling out of the contraption on the left' do
      let(:head) { BeamHead.new([0, 0], [-1, 0]) }

      it { is_expected.to be_empty }
    end

    context 'with a beam travelling out of the contraption on the right' do
      let(:head) { BeamHead.new([9, 0], [1, 0]) }

      it { is_expected.to be_empty }
    end

    context 'with a beam travelling out of the contraption on the top' do
      let(:head) { BeamHead.new([0, 0], [0, -1]) }

      it { is_expected.to be_empty }
    end

    context 'with a beam travelling out of the contraption on the bottom' do
      let(:head) { BeamHead.new([0, 9], [0, 1]) }

      it { is_expected.to be_empty }
    end

    context 'with a beam travelling right into an empty space' do
      let(:head) { BeamHead.new([1, 2], [1, 0]) }

      it { is_expected.to contain_exactly(BeamHead.new([2, 2], [1, 0])) }
    end

    context 'with a beam travelling right into a /' do
      let(:head) { BeamHead.new([3, 6], [1, 0]) }

      it { is_expected.to contain_exactly(BeamHead.new([4, 6], [0, -1])) }
    end

    context 'with a beam travelling right into a \\' do
      let(:head) { BeamHead.new([4, 0], [1, 0]) }

      it { is_expected.to contain_exactly(BeamHead.new([5, 0], [0, 1])) }
    end

    context 'with a beam travelling right into a -' do
      let(:head) { BeamHead.new([1, 1], [1, 0]) }

      it { is_expected.to contain_exactly(BeamHead.new([2, 1], [1, 0])) }
    end

    context 'with a beam travelling right into a |' do
      let(:head) { BeamHead.new([4, 2], [1, 0]) }

      it { is_expected.to contain_exactly(BeamHead.new([5, 2], [0, 1]), BeamHead.new([5, 2], [0, -1])) }
    end

    context 'with a beam travelling up into a |' do
      let(:head) { BeamHead.new([5, 3], [0, -1]) }

      it { is_expected.to contain_exactly(BeamHead.new([5, 2], [0, -1])) }
    end

    context 'with a beam travelling right into a -' do
      let(:head) { BeamHead.new([2, 2], [0, -1]) }

      it { is_expected.to contain_exactly(BeamHead.new([2, 1], [1, 0]), BeamHead.new([2, 1], [-1, 0])) }
    end
  end
end

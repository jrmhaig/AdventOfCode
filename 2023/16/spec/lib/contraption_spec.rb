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

  describe 'illuminate' do
    subject { contraption.illuminate(entry:, direction:) }

    context 'with a straight through path' do
      let(:data) { ['.....'] }
      let(:entry) { Vector[0, 0] }
      let(:direction) { Vector[1, 0] }

      it { is_expected.to eq(5) }
    end

    context 'with mirrors' do
      let(:data) do
        [
          '.\\...',
          '.../.',
          '.\\./.'
        ]
      end
      let(:entry) { Vector[0, 0] }
      let(:direction) { Vector[1, 0] }

      it { is_expected.to eq(8) }
    end

    context 'with - splitter while going right' do
      let(:data) do
        [
          '.-...'
        ]
      end
      let(:entry) { Vector[0, 0] }
      let(:direction) { Vector[1, 0] }

      it { is_expected.to eq(5) }
    end

    context 'with - splitter while going down' do
      let(:data) do
        [
          '.....',
          '.-...'
        ]
      end
      let(:entry) { Vector[1, 0] }
      let(:direction) { Vector[0, 1] }

      it { is_expected.to eq(6) }
    end

    context 'with | splitter while going right' do
      let(:data) do
        [
          '.....',
          '.|...',
          '.....',
          '.....',
          '.....',
          '.....'
        ]
      end
      let(:entry) { Vector[0, 1] }
      let(:direction) { Vector[1, 0] }

      it { is_expected.to eq(7) }
    end

    context 'with | splitter while going down' do
      let(:data) do
        [
          '.....',
          '.|...',
          '.....'
        ]
      end
      let(:entry) { Vector[1, 0] }
      let(:direction) { Vector[0, 1] }

      it { is_expected.to eq(3) }
    end

    context 'with a mirror at the entry point' do
      let(:data) do
        [
          '.....',
          '/....',
          '.....'
        ]
      end
      let(:entry) { Vector[0, 1] }
      let(:direction) { Vector[1, 0] }

      it { is_expected.to eq(2) }
    end

    context 'with a splitter at the entry point' do
      let(:data) do
        [
          '.....',
          '|....',
          '.....'
        ]
      end
      let(:entry) { Vector[0, 1] }
      let(:direction) { Vector[1, 0] }

      it { is_expected.to eq(3) }
    end

    context 'with a loop' do
      let(:data) do
        [
          '.....',
          './.\.',
          '...|.',
          '.\.|.',
          '.....'
        ]
      end
      let(:entry) { Vector[0, 2] }
      let(:direction) { Vector[1, 0] }

      it { is_expected.to eq(11) }
    end
  end
end

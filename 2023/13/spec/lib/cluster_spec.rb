require 'cluster'

RSpec.describe Cluster do
  subject(:cluster) { Cluster.new(*rows) }

  describe '#v_mirror' do
    subject { cluster.v_mirror }

    context 'with a vertical mirror' do
      let(:rows) do
        [
          '#.##..##.',
          '..#.##.#.',
          '##......#',
          '##......#',
          '..#.##.#.',
          '..##..##.',
          '#.#.##.#.'
        ]
      end

      it { is_expected.to eq 5 }
    end

    context 'with no vertical mirror' do
      let(:rows) do
        [
          '#...##..#',
          '#....#..#',
          '..##..###',
          '#####.##.',
          '#####.##.',
          '..##..###',
          '#....#..#'
        ]
      end

      it { is_expected.to eq 0 }
    end

    context 'with an example from the real input' do
      let(:rows) do
        [
          '.##.#..#.##.###',
          '####.#..#######',
          '.##.##.#.######',
          '#..#.#..#..#.##',
          '.##.##.##.###..',
          '..#.#.#.#.#.#..',
          '....#.#..#.####'
        ]
      end

      it { is_expected.to eq 14 }
    end
  end

  describe '#h_mirror' do
    subject { cluster.h_mirror }

    context 'with no horizontal mirror' do
      let(:rows) do
        [
          '#.##..##.',
          '..#.##.#.',
          '##......#',
          '##......#',
          '..#.##.#.',
          '..##..##.',
          '#.#.##.#.'
        ]
      end

      it { is_expected.to eq 0 }
    end

    context 'with a horizontal mirror' do
      let(:rows) do
        [
          '#...##..#',
          '#....#..#',
          '..##..###',
          '#####.##.',
          '#####.##.',
          '..##..###',
          '#....#..#'
        ]
      end

      it { is_expected.to eq 4 }
    end

    context 'with an example from the real input' do
      let(:rows) do
        [
          '.##.#..#.##.###',
          '####.#..#######',
          '.##.##.#.######',
          '#..#.#..#..#.##',
          '.##.##.##.###..',
          '..#.#.#.#.#.#..',
          '....#.#..#.####'
        ]
      end

      it { is_expected.to eq 0 }
    end
  end
end

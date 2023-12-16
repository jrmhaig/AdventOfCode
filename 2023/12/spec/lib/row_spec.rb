require 'row'
require 'ostruct'

RSpec.describe Row do
  subject(:row) { described_class.new(springs, *groups) }

  describe '#arrangements' do
    subject(:arrangements) { row.arrangements }

    context 'with a single group of 1' do
      let(:groups) { [1] }

      context 'when all springs are operational' do
        let(:springs) { '....' }

        it { is_expected.to eq(0) }
      end

      context 'when there are too many broken springs in a group' do
        let(:springs) { '.##.' }

        it { is_expected.to eq(0) }
      end

      context 'when there are too many groups of broken springs' do
        let(:springs) { '.#.#.' }

        it { is_expected.to eq(0) }
      end

      context 'when there is just one broken spring in a single group' do
        let(:springs) { '.#...' }

        it { is_expected.to eq(1) }
      end

      context 'when there is just one unknown spring in a single group' do
        let(:springs) { '.?...' }

        it { is_expected.to eq(1) }
      end

      context 'when there are multiple unknown springs' do
        let(:springs) { '.??.???.?..' }

        it { is_expected.to eq(6) }
      end

      context 'when there is one broken spring as well as broken springs' do
        let(:springs) { '.??.??.#.' }

        it { is_expected.to eq(1) }
      end

      context 'when the input row is nil' do
        let(:springs) { nil }

        it { is_expected.to eq(0) }
      end
    end

    context 'with a single group larger than 1' do
      let(:groups) { [3] }

      context 'when all springs are operational' do
        let(:springs) { '....' }

        it { is_expected.to eq(0) }
      end

      context 'when there are not enough broken springs in a group' do
        let(:springs) { '.##.' }

        it { is_expected.to eq(0) }
      end

      context 'when there are not enough broken springs in a group' do
        let(:springs) { '.#####.' }

        it { is_expected.to eq(0) }
      end

      context 'when there are too many groups of broken springs' do
        let(:springs) { '.###.###.' }

        it { is_expected.to eq(0) }
      end

      context 'when there are the right number of broken springs in a single group' do
        let(:springs) { '.###...' }

        it { is_expected.to eq(1) }
      end

      context 'when there are just enough unknown springs in a single group' do
        let(:springs) { '.???...' }

        it { is_expected.to eq(1) }
      end

      context 'when there are not enough unknown springs in a single group' do
        let(:springs) { '.??...' }

        it { is_expected.to eq(0) }
      end

      context 'when there are more than enough springs in a single group' do
        let(:springs) { '.?????..?.?.' }

        it { is_expected.to eq(3) }
      end

      context 'when there are more than enough springs in multiple groups' do
        let(:springs) { '.?????..???.????...' }

        it { is_expected.to eq(6) }
      end

      context 'when there is a group of broken springs as well as unknown springs' do
        let(:springs) { '.??.###.??..' }

        it { is_expected.to eq(1) }
      end

      context 'when there are not enough broken springs in a group joined with unknown springs' do
        let(:springs) { '.??.??#???.??..' }

        it { is_expected.to eq(3) }
      end

      context 'when there are broken springs in a group of unknown that are too far apart' do
        let(:springs) { '.??.?#?????#?.??..' }

        it { is_expected.to eq(0) }
      end

      context 'when the input row is nil' do
        let(:springs) { nil }

        it { is_expected.to eq(0) }
      end
    end

    context 'with multiple groups' do
      let(:groups) { [3, 3, 1] }

      let(:other_row) { OpenStruct.new(arrangements: 1) }

      before do
        # Ensure test object is created before mocking
        row
        allow(described_class).to receive(:new).and_return(other_row)
      end

      context 'when the match is not possible because of too many broken blocks' do
        let(:springs) { '.####.###.#.' }

        it { is_expected.to eq(0) }
      end

      context 'when the match is not possible because of insufficient blocks' do
        let(:springs) { '.##.###.#.' }

        it { is_expected.to eq(0) }
      end

      context 'when the first block matches exactly' do
        let(:springs) { '.###.###.#.' }

        it do
          arrangements
          expect(described_class).to have_received(:new).with('###.#.', 3, 1)
        end

        it { is_expected.to eq(1) }
      end

      context 'when the input row is nil' do
        let(:springs) { nil }

        it { is_expected.to eq(0) }
      end
    end

    context 'with the first example' do
      let(:springs) { '???.###' }
      let(:groups) { [1, 1, 3] }

      it { is_expected.to eq 1 }
    end

    context 'with the second example' do
      let(:springs) { '.??..??...?##.' }
      let(:groups) { [1, 1, 3] }

      it { is_expected.to eq 4 }
    end

    context 'with the third example' do
      let(:springs) { '?#?#?#?#?#?#?#?' }
      let(:groups) { [1, 3, 1, 6] }

      it { is_expected.to eq 1 }
    end

    context 'with the fourth example' do
      let(:springs) { '????.#...#...' }
      let(:groups) { [4, 1, 1] }

      it { is_expected.to eq 1 }
    end

    context 'with the fifth example' do
      let(:springs) { '????.######..#####.' }
      let(:groups) { [1, 6, 5] }

      it { is_expected.to eq 4 }
    end

    context 'with the sixth example' do
      let(:springs) { '?###????????' }
      let(:groups) { [3, 2, 1] }

      it { is_expected.to eq 10 }
    end

    context 'with another example' do
      let(:springs) { '????.#.?????#?#' }
      let(:groups) { [1, 6] }

      it { is_expected.to eq 1 }
    end

    context 'with yet another example' do
      let(:springs) { '??.?????#?' }
      let(:groups) { [1, 1, 3] }

      it { is_expected.to eq 11 }
    end

    context 'with the last example, maybe?' do
      let(:springs) { '??#???.?????????#??' }
      let(:groups) { [3, 4, 4] }

      it { is_expected.to eq 27 }
    end

    context 'with a small example that should really work' do
      let(:springs) { '??#??' }
      let(:groups) { [4] }

      it { is_expected.to eq 2 }
    end

    context 'with the last one now, surely!' do
      let(:springs) { '???#?????????#??' }
      let(:groups) { [4, 1, 5] }

      it { is_expected.to eq 30 }
    end
  end
end

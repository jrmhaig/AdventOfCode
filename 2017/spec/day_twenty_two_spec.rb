require 'advent_of_code/day_twenty_two'

RSpec.describe AdventOfCode::DayTwentyTwo do
  let(:grid) { AdventOfCode::DayTwentyTwo.new <<GRID
..#
#..
...
GRID
  }

  context 'simple' do
    describe '#step' do
      it 'satisfies the first example' do
        grid.step
        expect(grid.position).to eq([-1, 0])
        expect(grid.direction).to eq([-1, 0])
        expect(grid.get_bit(0, 0)).to eq :infected
      end

      it 'satisfies the second example' do
        2.times { grid.step }
        expect(grid.position).to eq([-1, 1])
        expect(grid.direction).to eq([0, 1])
        expect(grid.get_bit(-1, 0)).to be_nil
      end

      it 'satisfies the third example' do
        6.times { grid.step }
        expect(grid.position).to eq([-1, 1])
        expect(grid.direction).to eq([0, 1])
        expect(grid.get_bit(-1, 0)).to eq :infected
        expect(grid.get_bit(-2, 0)).to eq :infected
        expect(grid.get_bit(-1, 1)).to eq :infected
        expect(grid.get_bit(-2, 1)).to eq :infected
      end

      it 'satisfies the fourth example' do
        7.times { grid.step }
        expect(grid.position).to eq([0, 1])
        expect(grid.direction).to eq([1, 0])
        expect(grid.get_bit(-1, 1)).to be_nil
      end

      it 'satisfies the fifth example' do
        70.times { grid.step }
        expect(grid.position).to eq([1, 1])
        expect(grid.direction).to eq([0, 1])
        expect(grid.get_bit(1, 4)).to eq :infected
        expect(grid.get_bit(2, 4)).to eq :infected
        expect(grid.get_bit(0, 3)).to eq :infected
        expect(grid.get_bit(3, 3)).to eq :infected
        expect(grid.get_bit(-1, 2)).to eq :infected
        expect(grid.get_bit(4, 2)).to eq :infected
        expect(grid.get_bit(-2, 1)).to eq :infected
        expect(grid.get_bit(0, 1)).to eq :infected
        expect(grid.get_bit(4, 1)).to eq :infected
        expect(grid.get_bit(-2, 0)).to eq :infected
        expect(grid.get_bit(0, 0)).to eq :infected
        expect(grid.get_bit(3, 0)).to eq :infected
        expect(grid.get_bit(1, -1)).to eq :infected
        expect(grid.get_bit(2, -1)).to eq :infected
      end
    end

    describe '#infection_count' do
      it 'counts 41 infections after 70 bursts' do
        expect { 70.times { grid.step } }.to change(grid, :infection_count).to 41
      end

      it 'counts 5587 infections after 10000 bursts' do
        expect { 10000.times { grid.step } }.to change(grid, :infection_count).to 5587
      end
    end
  end

  context 'evolved' do
    before(:each) do
      grid.evolved = true
    end

    describe '#step' do
      it 'satisfies the first example' do
        grid.step
        expect(grid.position).to eq([-1, 0])
        expect(grid.direction).to eq([-1, 0])
        expect(grid.get_bit(0, 0)).to eq :weakened
      end

      it 'satisfies the second example' do
        2.times { grid.step }
        expect(grid.position).to eq([-1, 1])
        expect(grid.direction).to eq([0, 1])
        expect(grid.get_bit(-1, 0)).to eq :flagged
      end

      it 'satisfies the third example' do
        5.times { grid.step }
        expect(grid.position).to eq([-1, 0])
        expect(grid.direction).to eq([1, 0])
        expect(grid.get_bit(-2, 0)).to eq :weakened
        expect(grid.get_bit(-1, 1)).to eq :weakened
        expect(grid.get_bit(-2, 1)).to eq :weakened
      end

      it 'satisfies the fourth example' do
        6.times { grid.step }
        expect(grid.position).to eq([-2, 0])
        expect(grid.direction).to eq([-1, 0])
        expect(grid.get_bit(-1, 0)).to be_nil
      end

      it 'satisfies the fifth example' do
        7.times { grid.step }
        expect(grid.position).to eq([-3, 0])
        expect(grid.direction).to eq([-1, 0])
        expect(grid.get_bit(-2, 0)).to eq :infected
      end
    end

    describe '#infection_count' do
      it 'counts 26 infections after 100 bursts' do
        expect { 100.times { grid.step } }.to change(grid, :infection_count).to 26
      end

      it 'counts 2511944 infections after 10000000 bursts' do
        expect { 10000000.times { grid.step } }.to change(grid, :infection_count).to 2511944
      end
    end
  end
end

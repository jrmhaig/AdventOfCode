require 'advent_of_code/day_twenty_two'

RSpec.describe AdventOfCode::DayTwentyTwo do
  let(:grid) { AdventOfCode::DayTwentyTwo.new <<GRID
..#
#..
...
GRID
  }
  describe '#step' do
    it 'satisfies the first example' do
      grid.step
      expect(grid.position).to eq(Vector[-1, 0])
      expect(grid.direction).to eq(Vector[-1, 0])
      expect(grid.infected).to include(Vector[0, 0])
    end

    it 'satisfies the second example' do
      2.times { grid.step }
      expect(grid.position).to eq(Vector[-1, 1])
      expect(grid.direction).to eq(Vector[0, 1])
      expect(grid.infected).to_not include(Vector[-1, 0])
    end

    it 'satisfies the third example' do
      6.times { grid.step }
      expect(grid.position).to eq(Vector[-1, 1])
      expect(grid.direction).to eq(Vector[0, 1])
      expect(grid.infected).to include(Vector[-1, 0])
      expect(grid.infected).to include(Vector[-2, 0])
      expect(grid.infected).to include(Vector[-1, 1])
      expect(grid.infected).to include(Vector[-2, 1])
    end

    it 'satisfies the fourth example' do
      7.times { grid.step }
      expect(grid.position).to eq(Vector[0, 1])
      expect(grid.direction).to eq(Vector[1, 0])
      expect(grid.infected).to_not include(Vector[-1, 1])
    end

    it 'satisfies the fifth example' do
      70.times { grid.step }
      expect(grid.position).to eq(Vector[1, 1])
      expect(grid.direction).to eq(Vector[0, 1])
      expect(grid.infected).to match_array([
        Vector[1, 4], Vector[2, 4],
        Vector[0, 3], Vector[3, 3],
        Vector[-1, 2], Vector[4, 2],
        Vector[-2, 1], Vector[0, 1], Vector[4, 1],
        Vector[-2, 0], Vector[0, 0], Vector[3, 0],
        Vector[1, -1], Vector[2, -1]
      ])
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

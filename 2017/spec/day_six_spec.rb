require 'advent_of_code/day_six'

RSpec.describe AdventOfCode::DaySix do
  describe '#redistribute' do
    it 'satisfies the first example' do
      expect(AdventOfCode::DaySix.redistribute([0, 2, 7, 0])).to eq [2, 4, 1, 2]
    end

    it 'satisfies the second example' do
      expect(AdventOfCode::DaySix.redistribute([2, 4, 1, 2])).to eq [3, 1, 2, 3]
    end

    it 'satisfies the third example' do
      expect(AdventOfCode::DaySix.redistribute([3, 1, 2, 3])).to eq [0, 2, 3, 4]
    end

    it 'satisfies the fourth example' do
      expect(AdventOfCode::DaySix.redistribute([0, 2, 3, 4])).to eq [1, 3, 4, 1]
    end

    it 'satisfies the fifth example' do
      expect(AdventOfCode::DaySix.redistribute([1, 3, 4, 1])).to eq [2, 4, 1, 2]
    end
  end

  describe '#loop_count' do
    it 'satisfies the example' do
      expect(AdventOfCode::DaySix.loop_count([0, 2, 7, 0])).to eq 5
    end
  end

  describe '#loop_size' do
    it 'satisfies the example' do
      expect(AdventOfCode::DaySix.loop_size([0, 2, 7, 0])).to eq 4
    end
  end
end

require 'advent_of_code/day_three'

RSpec.describe AdventOfCode::DayThree do
  describe '#mpos' do
    it 'locates 1 at [0 ,0]' do
      expect(AdventOfCode::DayThree.new.mpos 1).to eq [0, 0]
    end

    it 'locates 9 at [1 ,-1]' do
      expect(AdventOfCode::DayThree.new.mpos 9).to eq [1, -1]
    end

    it 'locates 15 at [0, 2]' do
      expect(AdventOfCode::DayThree.new.mpos 15).to eq [0, 2]
    end

    it 'locates 43 at [-3, -3]' do
      expect(AdventOfCode::DayThree.new.mpos 43).to eq [-3, -3]
    end
  end

  describe '#manhattan' do
    it 'satisfies the first example' do
      expect(AdventOfCode::DayThree.new.manhattan 1).to eq 0
    end

    it 'satisfies the second example' do
      expect(AdventOfCode::DayThree.new.manhattan 12).to eq 3
    end

    it 'satisfies the third example' do
      expect(AdventOfCode::DayThree.new.manhattan 23).to eq 2
    end

    it 'satisfies the fourth example' do
      expect(AdventOfCode::DayThree.new.manhattan 1024).to eq 31
    end
  end

  describe '#memory_index' do
    it 'finds the index of memory location [0, 0]' do
      expect(AdventOfCode::DayThree.new.memory_index([0, 0])).to eq 1
    end

    it 'finds the index of memory location [1, 1]' do
      expect(AdventOfCode::DayThree.new.memory_index([1, 1])).to eq 3
    end

    it 'finds the index of memory location [0, 1]' do
      expect(AdventOfCode::DayThree.new.memory_index([0, 1])).to eq 4
    end

    it 'finds the index of memory location [-1, 1]' do
      expect(AdventOfCode::DayThree.new.memory_index([-1, 1])).to eq 5
    end

    it 'finds the index of memory location [-1, 0]' do
      expect(AdventOfCode::DayThree.new.memory_index([-1, 0])).to eq 6
    end

    it 'finds the index of memory location [-1, -1]' do
      expect(AdventOfCode::DayThree.new.memory_index([-1, -1])).to eq 7
    end

    it 'finds the index of memory location [-1, -2]' do
      expect(AdventOfCode::DayThree.new.memory_index([-1, -2])).to eq 22
    end

    it 'finds the index of memory location [2, -2]' do
      expect(AdventOfCode::DayThree.new.memory_index([2, -2])).to eq 25
    end
  end
end

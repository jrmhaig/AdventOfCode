require 'advent_of_code/day_three'

RSpec.describe AdventOfCode::DayThree do
  describe '#mpos' do
    it 'locates 1 at [0 ,0]' do
      expect(AdventOfCode::DayThree.mpos 1).to eq [0, 0]
    end

    it 'locates 9 at [1 ,-1]' do
      expect(AdventOfCode::DayThree.mpos 9).to eq [1, -1]
    end

    it 'locates 15 at [0, 2]' do
      expect(AdventOfCode::DayThree.mpos 15).to eq [0, 2]
    end

    it 'locates 43 at [-3, -3]' do
      expect(AdventOfCode::DayThree.mpos 43).to eq [-3, -3]
    end
  end

  describe '#manhattan' do
    it 'satisfies the first example' do
      expect(AdventOfCode::DayThree.manhattan 1).to eq 0
    end

    it 'satisfies the second example' do
      expect(AdventOfCode::DayThree.manhattan 12).to eq 3
    end

    it 'satisfies the third example' do
      expect(AdventOfCode::DayThree.manhattan 23).to eq 2
    end

    it 'satisfies the fourth example' do
      expect(AdventOfCode::DayThree.manhattan 1024).to eq 31
    end

  end
end

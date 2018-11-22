require 'advent_of_code/day_one'

RSpec.describe AdventOfCode::DayOne do
  describe '.travel' do
    it 'satisfies example 1' do
      expect(AdventOfCode::DayOne.travel('(())')).to eq 0
      expect(AdventOfCode::DayOne.travel('()()')).to eq 0
    end

    it 'satisfies example 2' do
      expect(AdventOfCode::DayOne.travel('(((')).to eq 3
      expect(AdventOfCode::DayOne.travel('(()(()(')).to eq 3
    end

    it 'satisfies example 3' do
      expect(AdventOfCode::DayOne.travel('))(((((')).to eq 3
    end

    it 'satisfies example 4' do
      expect(AdventOfCode::DayOne.travel('())')).to eq -1
      expect(AdventOfCode::DayOne.travel('))(')).to eq -1
    end

    it 'satisfies example 5' do
      expect(AdventOfCode::DayOne.travel(')))')).to eq -3
      expect(AdventOfCode::DayOne.travel(')())())')).to eq -3
    end
  end

  describe '.journey' do
    it 'travels straight to the basement' do
      expect(AdventOfCode::DayOne.journey(')')).to eq ([-1])
    end

    it 'returns the journey of the second example' do
      expect(AdventOfCode::DayOne.journey('()())')).to eq ([1, 0, 1, 0, -1])
    end
  end
end

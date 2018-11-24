require 'advent_of_code/day_three'

RSpec.describe AdventOfCode::DayThree do
  describe '.house_count' do
    it 'satisfies example 1' do
      expect(AdventOfCode::DayThree.house_count('>')).to eq 2
    end

    it 'satisfies example 2' do
      expect(AdventOfCode::DayThree.house_count('^>v<')).to eq 4
    end

    it 'satisfies example 3' do
      expect(AdventOfCode::DayThree.house_count('^v^v^v^v^v')).to eq 2
    end

    it 'satisfies example 1 with two Santas' do
      expect(AdventOfCode::DayThree.house_count('^v', santas: 2)).to eq 3
    end

    it 'satisfies example 2 with two Santas' do
      expect(AdventOfCode::DayThree.house_count('^>v<', santas: 2)).to eq 3
    end

    it 'satisfies example 3 with two Santas' do
      expect(AdventOfCode::DayThree.house_count('^v^v^v^v^v', santas: 2)).to eq 11
    end
  end
end

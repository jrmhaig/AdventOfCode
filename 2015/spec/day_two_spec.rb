require 'advent_of_code/day_two'

RSpec.describe AdventOfCode::DayTwo do
  describe '.one_present' do
    it 'satisfies example 1' do
      expect(AdventOfCode::DayTwo.one_present(2,3,4)).to eq 58
    end

    it 'satisfies example 2' do
      expect(AdventOfCode::DayTwo.one_present(1,1,10)).to eq 43
    end
  end

  describe '.all_presents' do
    it 'sums both examples' do
      expect(AdventOfCode::DayTwo.all_presents('2x3x4', '1x1x10')).to eq 101
    end
  end

  describe '.ribbon' do
    it 'satisfies the first experiment' do
      expect(AdventOfCode::DayTwo.ribbons(2,3,4)).to eq 34
    end

    it 'satisfies the first experiment' do
      expect(AdventOfCode::DayTwo.ribbons(1,1,10)).to eq 14
    end
  end

  describe '.all_ribbons' do
    it 'sums both examples' do
      expect(AdventOfCode::DayTwo.all_ribbons('2x3x4', '1x1x10')).to eq 48
    end
  end
end

require 'advent_of_code/day_four'

RSpec.describe AdventOfCode::DayFour do
  describe '.find_coin' do
    it 'satisfies example 1' do
      expect(AdventOfCode::DayFour.find_coin('abcdef')).to eq 609043
    end

    it 'satisfies example 2' do
      expect(AdventOfCode::DayFour.find_coin('pqrstuv')).to eq 1048970
    end
  end
end

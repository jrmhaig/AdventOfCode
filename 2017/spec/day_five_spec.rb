require 'advent_of_code/day_five'

RSpec.describe AdventOfCode::DayFive do
  describe '#jump' do
    it 'satisfies the example of part one' do
      expect(AdventOfCode::DayFive.jump(:one, 0, 3, 0, 1, -3)).to eq 5
    end

    it 'satisfies the example of part two' do
      expect(AdventOfCode::DayFive.jump(:two, 0, 3, 0, 1, -3)).to eq 10
    end
  end
end

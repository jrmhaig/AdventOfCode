require 'advent_of_code/day_five'

RSpec.describe AdventOfCode::DayFive do
  describe '#jump' do
    it 'satisfies the example' do
      expect(AdventOfCode::DayFive.jump(0, 3, 0, 1, -3)).to eq 5
    end
  end
end

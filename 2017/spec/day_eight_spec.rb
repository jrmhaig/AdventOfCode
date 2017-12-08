require 'advent_of_code/day_eight'

RSpec.describe AdventOfCode::DayEight do
  describe '#largest' do
    it 'satisfies the example' do
      register = AdventOfCode::DayEight.new([
        'b inc 5 if a > 1',
        'a inc 1 if b < 5',
        'c dec -10 if a >= 1',
        'c inc -20 if c == 10'
      ])
      expect(register.largest).to eq 1
    end
  end

  describe '#maximum' do
    it 'satisfies the example' do
      register = AdventOfCode::DayEight.new([
        'b inc 5 if a > 1',
        'a inc 1 if b < 5',
        'c dec -10 if a >= 1',
        'c inc -20 if c == 10'
      ])
      expect(register.maximum).to eq 10
    end
  end
end

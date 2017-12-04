require 'advent_of_code/day_four'

RSpec.describe AdventOfCode::DayFour do
  describe '#validate' do
    it 'satisfies the first example' do
      expect(AdventOfCode::DayFour.validate 'aa bb cc dd ee').to be_truthy
    end

    it 'satisfies the second example' do
      expect(AdventOfCode::DayFour.validate 'aa bb cc dd aa').to be_falsey
    end

    it 'satisfies the third example' do
      expect(AdventOfCode::DayFour.validate 'aa bb cc dd aaa').to be_truthy
    end
  end
end

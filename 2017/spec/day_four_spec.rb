require 'advent_of_code/day_four'

RSpec.describe AdventOfCode::DayFour do
  describe '#validate' do
    context 'part one' do
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

    context 'part two' do
      it 'satisfies the first example' do
        expect(AdventOfCode::DayFour.validate 'abcde fghij').to be_truthy
      end

      it 'satisfies the second example' do
        expect(AdventOfCode::DayFour.validate 'abcde xyz ecdab').to be_falsey
      end

      it 'satisfies the third example' do
        expect(AdventOfCode::DayFour.validate 'a ab abc abd abf abj').to be_truthy
      end

      it 'satisfies the fourth example' do
        expect(AdventOfCode::DayFour.validate 'iiii oiii ooii oooi oooo').to be_truthy
      end

      it 'satisfies the fifth example' do
        expect(AdventOfCode::DayFour.validate 'oiii ioii iioi iiio').to be_falsey
      end
    end
  end
end

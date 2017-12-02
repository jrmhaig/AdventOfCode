require 'advent_of_code/day_two'

RSpec.describe AdventOfCode::DayTwo do
  describe '#checksum' do
    it 'satisfies the given example for part one' do
      sheet = [
        '5 1 9 5',
        '7 5 3',
        '2 4 6 8'
      ]
      expect(AdventOfCode::DayTwo.checksum(sheet, :minmax)).to eq 18
    end

    it 'satisfies the given example for part two' do
      sheet = [
        '5 9 2 8',
        '9 4 7 3',
        '3 8 6 5'
      ]
      expect(AdventOfCode::DayTwo.checksum(sheet, :evendividers)).to eq 9
    end
  end

  # These would normally be private methods so shouldn't really need unit tests
  describe '#checkline' do
    context 'minmax method' do
      it 'finds the difference of the smallest and largest numbers' do
        expect(AdventOfCode::DayTwo.checkline('5 1 9 5', :minmax)).to eq 8
      end

      it 'correctly deals with all the same numbers' do
        expect(AdventOfCode::DayTwo.checkline('3 3 3 3 3', :minmax)).to eq 0
      end
    end

    context 'evendividers method' do
      it 'finds the correct pair' do
        expect(AdventOfCode::DayTwo.checkline('9 4 7 3', :evendividers)).to eq 3
      end
    end
  end

  describe '#evenly_divides?' do
    it '3 evenly divides 6' do
      expect(AdventOfCode::DayTwo.evenly_divides?(3, 6)).to be_truthy
    end

    it '3 does not evenly divide 7' do
      expect(AdventOfCode::DayTwo.evenly_divides?(3, 7)).to be_falsey
    end

    it '6 does not evenly divide 3' do
      expect(AdventOfCode::DayTwo.evenly_divides?(6, 3)).to be_falsey
    end

  end
end

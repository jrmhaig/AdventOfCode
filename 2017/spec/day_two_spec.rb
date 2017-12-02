require 'advent_of_code/day_two'

RSpec.describe AdventOfCode::DayTwo do
  describe '#checkline' do
    it 'finds the difference of the smallest and largest numbers' do
      expect(AdventOfCode::DayTwo.checkline('5 1 9 5')).to eq 8
    end

    it 'correctly deals with all the same numbers' do
      expect(AdventOfCode::DayTwo.checkline('3 3 3 3 3')).to eq 0
    end
  end

  describe '#checksum' do
    it 'satisfies the given example' do
      sheet = [
        '5 1 9 5',
        '7 5 3',
        '2 4 6 8'
      ]
      expect(AdventOfCode::DayTwo.checksum(sheet)).to eq 18
    end
  end
end

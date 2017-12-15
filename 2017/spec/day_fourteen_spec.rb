require 'advent_of_code/day_fourteen'

RSpec.describe AdventOfCode::DayFourteen do
  describe '#used' do
    it 'satisfies the example' do
      expect(AdventOfCode::DayFourteen.used('flqrgnkx')).to eq 8108
    end
  end
end

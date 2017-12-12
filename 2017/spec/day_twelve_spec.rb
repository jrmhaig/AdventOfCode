require 'advent_of_code/day_twelve'

RSpec.describe AdventOfCode::DayTwelve do
  describe '#group' do
    let(:comms) {
      AdventOfCode::DayTwelve.new(
        '0 <-> 2',
        '1 <-> 1',
        '2 <-> 0, 3, 4',
        '3 <-> 2, 4',
        '4 <-> 2, 3, 6',
        '5 <-> 6',
        '6 <-> 4, 5'
      )
    }

    it 'satisfies the example' do
      expect(comms.group(0)).to match_array([0, 2, 3, 4, 5, 6])
    end
  end
end

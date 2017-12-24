require 'advent_of_code/day_twenty_four'

RSpec.describe AdventOfCode::DayTwentyFour do
  let(:bridges) {
    AdventOfCode::DayTwentyFour.new(
      '0/2', '2/2', '2/3', '3/4', '3/5', '0/1', '10/1', '9/10'
      )
    }

  describe '#all' do
    it 'contains eleven bridges' do
      expect(bridges.all.count).to eq 11
    end
  end

  describe '#strongest' do
    it 'the strongest bridge has strength 31' do
      expect(bridges.strongest).to eq 31
    end

    it 'the strongest longest bridge has strength 19' do
      expect(bridges.strongest(:longest)).to eq 19
    end
  end
end

require 'advent_of_code/day_ten'

RSpec.describe AdventOfCode::DayTen do
  describe '#checksum' do
    it 'satisfies example' do
      hash = AdventOfCode::DayTen.new 5, [3, 4, 1, 5]
      expect(hash.checksum).to eq 12
    end
  end

  describe '#twist' do
    it 'satisfies the examples' do
      hash = AdventOfCode::DayTen.new 5, []
      expect { hash.twist(3) }.to change(hash, :code).to [2, 1, 0, 3, 4]
      expect { hash.twist(4) }.to change(hash, :code).to [4, 3, 0, 1, 2]
      expect { hash.twist(1) }.to_not change(hash, :code)
      expect { hash.twist(5) }.to change(hash, :code).to [3, 4, 2, 1, 0]
    end
  end
end

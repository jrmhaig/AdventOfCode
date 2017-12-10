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

  describe '#dense' do
    let(:extra) { [17, 31, 73, 47, 23] }

    it 'satisfies the first example' do
      hash = AdventOfCode::DayTen.new 256, [] + extra, 64
      expect(hash.dense).to eq 'a2582a3a0e66e6e86e3812dcb672a272'
    end

    it 'satisfies the second example' do
      hash = AdventOfCode::DayTen.new 256, 'AoC 2017'.split(//).map(&:ord) + extra, 64
      expect(hash.dense).to eq '33efeb34ea91902bb2f59c9920caa6cd'
    end

    it 'satisfies the third example' do
      hash = AdventOfCode::DayTen.new 256, '1,2,3'.split(//).map(&:ord) + extra, 64
      expect(hash.dense).to eq '3efbe78a8d82f29979031a4aa0b16a9d'
    end

    it 'satisfies the fourth example' do
      hash = AdventOfCode::DayTen.new 256, '1,2,4'.split(//).map(&:ord) + extra, 64
      expect(hash.dense).to eq '63960835bcdc130f0b66d7ff4f6a5a8e'
    end
  end
end

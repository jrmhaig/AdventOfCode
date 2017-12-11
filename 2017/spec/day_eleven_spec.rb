require 'advent_of_code/day_eleven'

RSpec.describe AdventOfCode::DayEleven do
  describe '#distance' do
    let(:metric) { AdventOfCode::DayEleven.new }

    it 'satisfies the first example' do
      metric.walk 'ne', 'ne', 'ne'
      expect(metric.distance).to eq 3
    end

    it 'satisfies the second example' do
      metric.walk 'ne', 'ne', 'sw', 'sw'
      expect(metric.distance).to eq 0
    end

    it 'satisfies the third example' do
      metric.walk 'ne', 'ne', 's', 's'
      expect(metric.distance).to eq 2
    end

    it 'satisfies the fourth example' do
      metric.walk 'se', 'sw', 'se', 'sw', 'sw'
      expect(metric.distance).to eq 3
    end

    it 'works going straight north' do
      metric.walk 'n', 'n', 'n', 'n', 'n'
      expect(metric.distance).to eq 5
    end

    it 'works going straight west' do
      metric.walk 'nw', 'sw', 'nw', 'sw', 'nw'
      expect(metric.distance).to eq 5
    end
  end
end

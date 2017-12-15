require 'advent_of_code/day_fourteen'

RSpec.describe AdventOfCode::DayFourteen do
  let(:code) { AdventOfCode::DayFourteen.new('flqrgnkx') }
  describe '#used' do
    it 'satisfies the example' do
      expect(code.used).to eq 8108
    end
  end

  describe '#number_of_groups' do
    it 'satisfies the example' do
      expect(code.number_of_groups).to eq 1242
    end
  end
end

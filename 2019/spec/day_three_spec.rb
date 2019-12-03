require 'day_three'

RSpec.describe DayThree do
  describe '#closest_distance' do
    it 'finds the closest distance for the example' do
      expect(DayThree.new('R8,U5,L5,D3', 'U7,R6,D4,L4').closest_distance).to eq 6
    end
  end
end

require 'day_one'

RSpec.describe DayOne do
  describe '#fuel_required' do
    it 'requires 2 fuel for mass 12' do
      expect(DayOne.new(12).fuel_required).to eq 2
    end

    it 'requires 2 fuel for mass 14' do
      expect(DayOne.new(14).fuel_required).to eq 2
    end

    it 'requires 654 fuel for mass 1969' do
      expect(DayOne.new(1969).fuel_required).to eq 654
    end

    it 'requires 33583 fuel for mass 100756' do
      expect(DayOne.new(100756).fuel_required).to eq 33583
    end

    it 'sums all the fuel requirements' do
      expect(DayOne.new(12, 14, 1969, 100756).fuel_required).to eq 2 + 2 + 654 + 33583
    end
  end
end

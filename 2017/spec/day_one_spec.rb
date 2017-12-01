require 'advent_of_code/day_one'

RSpec.describe AdventOfCode::DayOne do
  describe '#captcha' do
    it 'returns zero for no repeated digits' do
      expect(AdventOfCode::DayOne.captcha '1234').to eq 0
    end

    it 'detects a repeated digit' do
      expect(AdventOfCode::DayOne.captcha '112').to eq 1
    end

    it 'sums the repeated digit' do
      expect(AdventOfCode::DayOne.captcha '332').to eq 3
    end

    it 'matches last against first' do
      expect(AdventOfCode::DayOne.captcha '52135').to eq 5
    end

    context 'Examples' do
      it 'satisfies the first given example' do
        expect(AdventOfCode::DayOne.captcha '1122').to eq 3
      end

      it 'satisfies the second given example' do
        expect(AdventOfCode::DayOne.captcha '1111').to eq 4
      end

      it 'satisfies the third given example' do
        expect(AdventOfCode::DayOne.captcha '1234').to eq 0
      end

      it 'satisfies the fourth given example' do
        expect(AdventOfCode::DayOne.captcha '91212129').to eq 9
      end
    end
  end
end

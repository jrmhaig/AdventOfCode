require 'advent_of_code/day_five'

RSpec.describe AdventOfCode::DayFive do
  describe '.is_nice?' do
    it 'indicates ugknbfddgicrmopn is nice' do
      expect(AdventOfCode::DayFive.is_nice? 'ugknbfddgicrmopn').to be_truthy
    end

    it 'indicates aaa is nice' do
      expect(AdventOfCode::DayFive.is_nice? 'aaa').to be_truthy
    end

    it 'indicates jchzalrnumimnmhp is naughty' do
      expect(AdventOfCode::DayFive.is_nice? 'jchzalrnumimnmhp' ).to be_falsey
    end

    it 'indicates haegwjzuvuyypxyu is naughty' do
      expect(AdventOfCode::DayFive.is_nice? 'haegwjzuvuyypxyu' ).to be_falsey
    end

    it 'indicates dvszwmarrgswjxmb is naughty' do
      expect(AdventOfCode::DayFive.is_nice? 'dvszwmarrgswjxmb' ).to be_falsey
    end
  end

  describe '.is_really_nice?' do
    it 'indicated qjhvhtzxzqqjkmpb is nice' do
      expect(AdventOfCode::DayFive.is_really_nice? 'qjhvhtzxzqqjkmpb' ).to be_truthy
    end

    it 'indicated xxyxx is nice' do
      expect(AdventOfCode::DayFive.is_really_nice? 'xxyxx' ).to be_truthy
    end

    it 'indicated uurcxstgmygtbstg is naughty' do
      expect(AdventOfCode::DayFive.is_really_nice? 'uurcxstgmygtbstg' ).to be_falsey
    end

    it 'indicated ieodomkazucvgmuy is naughty' do
      expect(AdventOfCode::DayFive.is_really_nice? 'ieodomkazucvgmuy' ).to be_falsey
    end
  end
end

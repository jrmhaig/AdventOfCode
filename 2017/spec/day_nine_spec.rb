require 'advent_of_code/day_nine'

RSpec.describe AdventOfCode::DayNine do
  describe '#score' do
    context 'garbage' do
      it 'satisfies first example' do
        expect(AdventOfCode::DayNine.score('<>')).to eq 0
      end

      it 'satisfies second example' do
        expect(AdventOfCode::DayNine.score('<random characters>')).to eq 0
      end

      it 'satisfies third example' do
        expect(AdventOfCode::DayNine.score('<<<<>')).to eq 0
      end

      it 'satisfies fourth example' do
        expect(AdventOfCode::DayNine.score('<{!>}>')).to eq 0
      end

      it 'satisfies fifth example' do
        expect(AdventOfCode::DayNine.score('<!!>')).to eq 0
      end

      it 'satisfies sixth example' do
        expect(AdventOfCode::DayNine.score('<!!!>>')).to eq 0
      end

      it 'satisfies seventh example' do
        expect(AdventOfCode::DayNine.score('<{o"i!a,<{i<a>')).to eq 0
      end
    end

    context 'good' do
      it 'satisfies first example' do
        expect(AdventOfCode::DayNine.score('{}')).to eq 1
      end

      it 'satisfies second example' do
        expect(AdventOfCode::DayNine.score('{{{}}}')).to eq 6
      end

      it 'satisfies third example' do
        expect(AdventOfCode::DayNine.score('{{},{}}')).to eq 5
      end

      it 'satisfies fourth example' do
        expect(AdventOfCode::DayNine.score('{{{},{},{{}}}}')).to eq 16
      end

      it 'satisfies fifth example' do
        expect(AdventOfCode::DayNine.score('{<a>,<a>,<a>,<a>}')).to eq 1
      end

      it 'satisfies sixth example' do
        expect(AdventOfCode::DayNine.score('{{<ab>},{<ab>},{<ab>},{<ab>}}')).to eq 9
      end

      it 'satisfies seventh example' do
        expect(AdventOfCode::DayNine.score('{{<!!>},{<!!>},{<!!>},{<!!>}}')).to eq 9
      end

      it 'satisfies eigth example' do
        expect(AdventOfCode::DayNine.score('{{<a!>},{<a!>},{<a!>},{<ab>}}')).to eq 3
      end
    end
  end
end




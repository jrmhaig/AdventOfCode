require 'advent_of_code/day_nine'

RSpec.describe AdventOfCode::DayNine do
  describe '#score' do
    context 'garbage' do
      it 'satisfies first example' do
        stream = AdventOfCode::DayNine.new('<>')
        expect(stream.score).to eq 0
      end

      it 'satisfies second example' do
        stream = AdventOfCode::DayNine.new('<random characters>')
        expect(stream.score).to eq 0
      end

      it 'satisfies third example' do
        stream = AdventOfCode::DayNine.new('<<<<>')
        expect(stream.score).to eq 0
      end

      it 'satisfies fourth example' do
        stream = AdventOfCode::DayNine.new('<{!>}>')
        expect(stream.score).to eq 0
      end

      it 'satisfies fifth example' do
        stream = AdventOfCode::DayNine.new('<!!>')
        expect(stream.score).to eq 0
      end

      it 'satisfies sixth example' do
        stream = AdventOfCode::DayNine.new('<!!!>>')
        expect(stream.score).to eq 0
      end

      it 'satisfies seventh example' do
        stream = AdventOfCode::DayNine.new('<{o"i!a,<{i<a>')
        expect(stream.score).to eq 0
      end
    end

    context 'good' do
      it 'satisfies first example' do
        stream = AdventOfCode::DayNine.new('{}')
        expect(stream.score).to eq 1
      end

      it 'satisfies second example' do
        stream = AdventOfCode::DayNine.new('{{{}}}')
        expect(stream.score).to eq 6
      end

      it 'satisfies third example' do
        stream = AdventOfCode::DayNine.new('{{},{}}')
        expect(stream.score).to eq 5
      end

      it 'satisfies fourth example' do
        stream = AdventOfCode::DayNine.new('{{{},{},{{}}}}')
        expect(stream.score).to eq 16
      end

      it 'satisfies fifth example' do
        stream = AdventOfCode::DayNine.new('{<a>,<a>,<a>,<a>}')
        expect(stream.score).to eq 1
      end

      it 'satisfies sixth example' do
        stream = AdventOfCode::DayNine.new('{{<ab>},{<ab>},{<ab>},{<ab>}}')
        expect(stream.score).to eq 9
      end

      it 'satisfies seventh example' do
        stream = AdventOfCode::DayNine.new('{{<!!>},{<!!>},{<!!>},{<!!>}}')
        expect(stream.score).to eq 9
      end

      it 'satisfies eigth example' do
        stream = AdventOfCode::DayNine.new('{{<a!>},{<a!>},{<a!>},{<ab>}}')
        expect(stream.score).to eq 3
      end
    end
  end

  describe 'garbage_count' do
    it 'satisfies first example' do
      stream = AdventOfCode::DayNine.new('<>')
      expect(stream.garbage_count).to eq 0
    end

    it 'satisfies second example' do
      stream = AdventOfCode::DayNine.new('<random characters>')
      expect(stream.garbage_count).to eq 17
    end

    it 'satisfies third example' do
      stream = AdventOfCode::DayNine.new('<<<<>')
      expect(stream.garbage_count).to eq 3
    end

    it 'satisfies fourth example' do
      stream = AdventOfCode::DayNine.new('<{!>}>')
      expect(stream.garbage_count).to eq 2
    end

    it 'satisfies fifth example' do
      stream = AdventOfCode::DayNine.new('<!!>')
      expect(stream.garbage_count).to eq 0
    end

    it 'satisfies sixth example' do
      stream = AdventOfCode::DayNine.new('<!!!>>')
      expect(stream.garbage_count).to eq 0
    end

    it 'satisfies seventh example' do
      stream = AdventOfCode::DayNine.new('<{o"i!a,<{i<a>')
      expect(stream.garbage_count).to eq 10
    end
  end
end

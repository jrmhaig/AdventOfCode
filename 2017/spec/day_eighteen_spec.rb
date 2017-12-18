require 'advent_of_code/day_eighteen'

RSpec.describe AdventOfCode::DayEighteen do
  context 'part one' do
    let(:duet) {
      AdventOfCode::DayEighteen.new(
        'set a 1',
        'add a 2',
        'mul a a',
        'mod a 5',
        'snd a',
        'set a 0',
        'rcv a',
        'jgz a -1',
        'set a 1',
        'jgz a -2'
      )
    }

    before(:each) do
      duet.method = :simple
    end

    describe '#step' do
      it 'satisfies the example' do
        # First 4 steps
        4.times { duet.step }
        expect(duet.values['a']).to eq 4
        # 5th step. Play value of a
        expect { duet.step }.to change(duet, :played).from([]).to([4])
        # 6th step. Set a back to zero
        duet.step
        # 7th step. Recover a. Skipped as a is zero
        expect(duet.step).to be_nil
        # 8th step. Jump back. Skipped as a is zero (ie, move on as normal)
        expect { duet.step }.to change(duet, :pointer).by 1
        # 9th step. Set a to 1
        duet.step
        # 10th step. Jump back two
        expect { duet.step }.to change(duet, :pointer).by -2
        # 8th step. Jump back one
        expect { duet.step }.to change(duet, :pointer).by -1
        # 7th step. Recover a ( = 1)
        expect(duet.step).to eq 4
      end
    end

    context 'part one' do
      it 'gets the first recovered value' do
        expect(duet.recover).to eq 4
      end
    end
  end

  context 'part two' do
    let(:duet) {
      AdventOfCode::DayEighteen.new(
        'snd 1',
        'snd 2',
        'snd p',
        'rcv a',
        'rcv b',
        'rcv c',
        'rcv d'
      )
    }

    before(:each) do
      duet.method = :complex
    end

    describe '#run' do
      it 'satisfies the example' do
        duet.run
        expect(duet.values(0)['c']).to eq 1
        expect(duet.values(1)['c']).to eq 0
      end
    end
  end
end

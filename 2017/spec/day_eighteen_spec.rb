require 'advent_of_code/day_eighteen'

RSpec.describe AdventOfCode::DayEighteen do
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

  describe '#recover' do
    it 'gets the first recovered value' do
      expect(duet.recover).to eq 4
    end
  end
end

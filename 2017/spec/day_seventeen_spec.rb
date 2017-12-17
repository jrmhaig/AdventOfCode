require 'advent_of_code/day_seventeen'

RSpec.describe AdventOfCode::DaySeventeen do
  let(:spinlock) { AdventOfCode::DaySeventeen.new(3) }

  context 'part one' do
    describe '#step' do
      it 'satisfies the example' do
        expect {
          spinlock.step
        }.to change(spinlock, :buffer).from([0]).to([0, 1])
        expect {
          spinlock.step
        }.to change(spinlock, :buffer).from([0, 1]).to([0, 2, 1])
        expect {
          spinlock.step
        }.to change(spinlock, :buffer).from([0, 2, 1]).to([0, 2, 3, 1])
        expect {
          spinlock.step
          spinlock.step
          spinlock.step
          spinlock.step
          spinlock.step
          spinlock.step
        }.to change(spinlock, :buffer).from([0, 2, 3, 1]).to([0, 9, 5, 7, 2, 4, 3, 8, 6, 1])
      end
    end

    describe '#run' do
      it 'satisfies the example' do
        expect(spinlock.run(2017)).to eq 638
      end
    end
  end

  context 'part two' do
    describe '#pointers' do
      it 'satisfies the example' do
        spinlock.run 9
        expect(spinlock.pointers).to eq(
          [0, 1, 1, 2, 2, 1, 5, 2, 6, 1]
        )
      end
    end
  end
end

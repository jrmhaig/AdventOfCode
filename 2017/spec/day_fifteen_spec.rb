require 'advent_of_code/day_fifteen'

RSpec.describe AdventOfCode::DayFifteen do
  context 'general' do
    let(:pair) { AdventOfCode::DayFifteen.new(:simple, 65, 8921) }
    describe '#compare' do
      it 'compares the first example' do
        expect(pair.compare(1092455, 430625591)).to be_falsey
      end

      it 'compares the second example' do
        expect(pair.compare(1181022009, 1233683848)).to be_falsey
      end

      it 'compares the third example' do
        expect(pair.compare(245556042, 1431495498)).to be_truthy
      end

      it 'compares the fourth example' do
        expect(pair.compare(1744312007, 137874439)).to be_falsey
      end

      it 'compares the fifth example' do
        expect(pair.compare(1352636452, 285222916)).to be_falsey
      end
    end
  end

  context 'part one' do
    let(:pair) { AdventOfCode::DayFifteen.new(:simple, 65, 8921) }
    describe '#generate_next' do
      it 'generates the example values for A' do
        expect(pair.generate_next(:a, 65)).to eq 1092455
        expect(pair.generate_next(:a, 1092455)).to eq 1181022009
        expect(pair.generate_next(:a, 1181022009)).to eq 245556042
        expect(pair.generate_next(:a, 245556042)).to eq 1744312007
        expect(pair.generate_next(:a, 1744312007)).to eq 1352636452
      end

      it 'generates the example values for B' do
        expect(pair.generate_next(:b, 8921)).to eq 430625591
        expect(pair.generate_next(:b, 430625591)).to eq 1233683848
        expect(pair.generate_next(:b, 1233683848)).to eq 1431495498
        expect(pair.generate_next(:b, 1431495498)).to eq 137874439
        expect(pair.generate_next(:b, 137874439)).to eq 285222916
      end
    end

    describe '#count' do
      it 'satisfies the example' do
        expect(pair.count(40_000_000)).to eq 588
      end
    end
  end

  context 'part two' do
    let(:pair) { AdventOfCode::DayFifteen.new(:advanced, 65, 8921) }
    describe '#generate_next' do
      it 'generates the example values for A' do
        expect(pair.generate_next(:a, 65)).to eq 1352636452
        expect(pair.generate_next(:a, 1352636452)).to eq 1992081072
        expect(pair.generate_next(:a, 1992081072)).to eq 530830436
        expect(pair.generate_next(:a, 530830436)).to eq 1980017072
        expect(pair.generate_next(:a, 1980017072)).to eq 740335192
      end

      it 'generates the example values for B' do
        expect(pair.generate_next(:b, 8921)).to eq 1233683848
        expect(pair.generate_next(:b, 1233683848)).to eq 862516352
        expect(pair.generate_next(:b, 862516352)).to eq 1159784568
        expect(pair.generate_next(:b, 1159784568)).to eq 1616057672
        expect(pair.generate_next(:b, 1616057672)).to eq 412269392
      end
    end

    describe '#count' do
      it 'satisfies the example' do
        expect(pair.count(5_000_000)).to eq 309
      end
    end
  end
end

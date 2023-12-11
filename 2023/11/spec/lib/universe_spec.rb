require 'universe'

RSpec.describe Universe do
  subject(:universe) { described_class.new(x, y) }

  let(:x) { 10 }
  let(:y) { 10 }

  describe 'distance' do
    subject { universe.distance(a, b) }

    let(:a) { [1, 5] }
    let(:b) { [4, 9] }

    context 'when a is not in the universe' do
      before { universe.add_galaxy(*b) }

      it { is_expected.to be_falsey }
    end

    context 'when b is not in the universe' do
      before { universe.add_galaxy(*a) }

      it { is_expected.to be_falsey }
    end

    context 'with galaxies in all rows and columns' do
      before do
        universe.add_galaxy(*a)
        universe.add_galaxy(*b)
        x.times { |i| y.times { |j| universe.add_galaxy(i, j) } }
      end

      it { is_expected.to eq(7) }
    end

    context 'with an empty row between the galaxies' do
      before do
        universe.add_galaxy(*a)
        universe.add_galaxy(*b)
        x.times do |i|
          y.times do |j|
            next if j == 7
            universe.add_galaxy(i, j)
          end
        end
      end

      it { is_expected.to eq(8) }
    end

    context 'with an empty column between the galaxies' do
      before do
        universe.add_galaxy(*a)
        universe.add_galaxy(*b)
        x.times do |i|
          next if i == 2
          y.times do |j|
            universe.add_galaxy(i, j)
          end
        end
      end

      it { is_expected.to eq(8) }
    end

    context 'with the test data' do
      let(:x) { 10 }
      let(:y) { 10 }

      before do
        universe.add_galaxy(3, 0) # 1
        universe.add_galaxy(7, 1) # 2
        universe.add_galaxy(0, 2) # 3
        universe.add_galaxy(6, 4) # 4
        universe.add_galaxy(1, 5) # 5
        universe.add_galaxy(9, 6) # 6
        universe.add_galaxy(7, 8) # 7
        universe.add_galaxy(0, 9) # 8
        universe.add_galaxy(4, 9) # 9
      end

      it { expect(universe.distance([3, 0], [7, 8])).to eq(15) }
      it { expect(universe.distance([0, 2], [9, 6])).to eq(17) }
      it { expect(universe.distance([0, 9], [4, 9])).to eq(5) }
      it { expect(universe.distance([9, 6], [0, 2])).to eq(17) }
    end
  end
end

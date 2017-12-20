require 'advent_of_code/day_twenty'

RSpec.describe AdventOfCode::DayTwenty do
  let(:system) {
    AdventOfCode::DayTwenty.new(
      'p=< 3,0,0>, v=< 2,0,0>, a=<-1,0,0>',
      'p=< 4,0,0>, v=< 0,0,0>, a=<-2,0,0>'
    )
  }

  describe '#step' do
    it 'makes the example steps' do
      # I am unable to use the `change` matcher here
      # See https://github.com/rspec/rspec-expectations/issues/1030
      system.step
      expect(system.particles).to eq(
        [
          {p: Vector[4, 0, 0], v: Vector[1, 0, 0], a: Vector[-1, 0, 0]},
          {p: Vector[2, 0, 0], v: Vector[-2, 0, 0], a: Vector[-2, 0, 0]}
        ]
      )
      system.step
      expect(system.particles).to eq(
        [
          {p: Vector[4, 0, 0], v: Vector[0, 0, 0], a: Vector[-1, 0, 0]},
          {p: Vector[-2, 0, 0], v: Vector[-4, 0, 0], a: Vector[-2, 0, 0]}
        ]
      )
      system.step
      expect(system.particles).to eq(
        [
          {p: Vector[3, 0, 0], v: Vector[-1, 0, 0], a: Vector[-1, 0, 0]},
          {p: Vector[-8, 0, 0], v: Vector[-6, 0, 0], a: Vector[-2, 0, 0]}
        ]
      )
    end
  end

  describe '#steady?' do
    # A vector is 'steady' if the corresponding coordinates p, v and a all
    # have the same sign
    it 'is steady with non-zero values' do
      expect(system.steady?({p: Vector[1, -2, 3], v: Vector[8, -3, 4], a: Vector[1, -2, 3]})).to be_truthy
    end

    it 'is not steady when a is different' do
      expect(system.steady?({p: Vector[1, -2, 3], v: Vector[8, -3, 4], a: Vector[-1, -2, 3]})).to be_falsey
    end

    it 'is not steady when v is different' do
      expect(system.steady?({p: Vector[1, -2, 3], v: Vector[8, 3, 4], a: Vector[1, -2, 3]})).to be_falsey
    end

    it 'is not steady when a is different' do
      expect(system.steady?({p: Vector[1, -2, -3], v: Vector[8, -3, 4], a: Vector[1, -2, 3]})).to be_falsey
    end

    it 'is steady when all of one coordinate are zero' do
      expect(system.steady?({p: Vector[1, -2, 0], v: Vector[8, -3, 0], a: Vector[1, -2, 0]})).to be_truthy
    end

    it 'is steady if accelleration is zero and the others are in the same direction' do
      expect(system.steady?({p: Vector[1, -2, 2], v: Vector[8, -3, 6], a: Vector[1, 0, 3]})).to be_truthy
    end
  end

  describe '#all_steady?' do
    it 'all particles are steady after 5 steps' do
      system.step
      expect(system.all_steady?).to be_falsey
      3.times { system.step }
      expect(system.all_steady?).to be_falsey
      system.step
      expect(system.all_steady?).to be_truthy
    end
  end

  describe '#manhatten' do
    it 'finds the manhatten distance for a particle' do
      expect(system.manhatten({p: Vector[1, -2, -3], v: Vector[8, -3, 4], a: Vector[1, -2, 3]})).to eq 6
    end

    it 'finds the manhatten accelleration for a particle' do
      expect(system.manhatten({p: Vector[1, -2, -3], v: Vector[8, -3, 4], a: Vector[5, -2, 3]}, :a)).to eq 10
    end
  end

  describe '#find_closest' do
    it 'identifies the closest particle over long term' do
      expect(system.find_closest).to eq 0
    end
  end
end

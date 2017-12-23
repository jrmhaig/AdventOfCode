require 'advent_of_code/day_twenty_three'

RSpec.describe AdventOfCode::DayTwentyThree do
  let(:coprocessor) { AdventOfCode::DayTwentyThree.new }

  describe '#set' do
    it 'assigns key the value of another key' do
      coprocessor.register = {
        'x' => 0,
        'y' => 1
      }
      expect{ coprocessor.set('x', 'y') }.to change{ coprocessor.register['x'] }.from(0).to(1)
    end

    it 'assigns key as a value' do
      coprocessor.register = {
        'x' => 0
      }
      expect{ coprocessor.set('x', '3') }.to change{ coprocessor.register['x'] }.from(0).to(3)
    end

    it 'jumps by one' do
      coprocessor.register = {
        'x' => 2,
        'y' => 3
      }
      expect{ coprocessor.set('x', 'y') }.to change(coprocessor, :pointer).by 1
    end
  end

  describe '#sub' do
    it 'subtracts one key value from another' do
      coprocessor.register = {
        'x' => 5,
        'y' => 2
      }
      expect{ coprocessor.sub('x', 'y') }.to change{ coprocessor.register['x'] }.from(5).to(3)
    end

    it 'subtracts a value from a key' do
      coprocessor.register = {
        'x' => 5
      }
      expect{ coprocessor.sub('x', '3') }.to change{ coprocessor.register['x'] }.from(5).to(2)
    end

    it 'jumps by one' do
      coprocessor.register = {
        'x' => 2,
        'y' => 3
      }
      expect{ coprocessor.sub('x', 'y') }.to change(coprocessor, :pointer).by 1
    end
  end

  describe '#mul' do
    it 'multiply one key value with another' do
      coprocessor.register = {
        'x' => 2,
        'y' => 3
      }
      expect{ coprocessor.mul('x', 'y') }.to change{ coprocessor.register['x'] }.from(2).to(6)
    end

    it 'multiply a key by a number' do
      coprocessor.register = {
        'x' => 3
      }
      expect{ coprocessor.mul('x', '4') }.to change{ coprocessor.register['x'] }.from(3).to(12)
    end

    it 'jumps by one' do
      coprocessor.register = {
        'x' => 2,
        'y' => 3
      }
      expect{ coprocessor.mul('x', 'y') }.to change(coprocessor, :pointer).by 1
    end
  end

  describe '#jnz' do
    it 'jumps the value of another key' do
      coprocessor.register = {
        'x' => 2,
        'y' => 3
      }
      expect{ coprocessor.jnz('x', 'y') }.to change(coprocessor, :pointer).by 3
    end

    it 'does not jump' do
      coprocessor.register = {
        'x' => 0,
        'y' => 3
      }
      expect{ coprocessor.jnz('x', 'y') }.to change(coprocessor, :pointer).by 1
    end

    it 'jumps a given amount' do
      coprocessor.register = {
        'x' => 2
      }
      expect{ coprocessor.jnz('x', '-5') }.to change(coprocessor, :pointer).by -5
    end

    it 'does not jump' do
      coprocessor.register = {
        'x' => 0
      }
      expect{ coprocessor.jnz('x', '-5') }.to change(coprocessor, :pointer).by 1
    end
  end
end

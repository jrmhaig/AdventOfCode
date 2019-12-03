require 'day_two'

RSpec.describe DayTwo do
  describe '#run' do
    it 'does one pass for first example' do
      intcode = DayTwo.new(1, 0, 0, 0, 99)
      expect {
        intcode.run
      }.to change(intcode, :state).to([2, 0, 0, 0, 99])
    end

    it 'does one pass for second example' do
      intcode = DayTwo.new(2, 3, 0, 3, 99)
      expect {
        intcode.run
      }.to change(intcode, :state).to([2, 3, 0, 6, 99])
    end

    it 'does one pass for third example' do
      intcode = DayTwo.new(2, 4, 4, 5, 99, 0)
      expect {
        intcode.run
      }.to change(intcode, :state).to([2, 4, 4, 5, 99, 9801])
    end

    it 'does two pass for fourth example' do
      intcode = DayTwo.new(1, 1, 1, 4, 99, 5, 6, 0, 99)
      expect {
        intcode.run
      }.to change(intcode, :state).to([30, 1, 1, 4, 2, 5, 6, 0, 99])
    end
  end
end

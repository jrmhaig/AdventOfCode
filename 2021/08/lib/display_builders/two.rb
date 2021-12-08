require 'display'

module DisplayBuilders
  class Two
    attr_reader :zero, :one, :two, :three, :four, :five,
                :six, :seven, :eight, :nine

    def initialize(*data)
      data = data.sort_by(&:length).map { |n| n.split(//).sort }

      @one = data[0]
      @four = data[2]
      @seven = data[1]
      @eight = data[9]

      @three = data[3..5].select { |n| (n - @one).count == 3 }.first
      @two = data[3..5]
        .select { |n| (n - @one).count == 4 }
        .select { |n| (n - @four).count == 3 }.first
      @five = data[3..5]
        .select { |n| (n - @one).count == 4 }
        .select { |n| (n - @four).count == 2 }.first

      @zero = data[6..8]
        .select { |n| (n - @one).count == 4 }
        .select { |n| (n - @four).count == 3 }.first
      @six = data[6..8]
        .select { |n| (n - @one).count == 5 }.first
      @nine = data[6..8]
        .select { |n| (n - @one).count == 4 }
        .select { |n| (n - @four).count == 2 }.first
    end
  end
end

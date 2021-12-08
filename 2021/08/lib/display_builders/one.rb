require 'display'

module DisplayBuilders
  class One
    attr_reader :zero, :one, :two, :three, :four, :five,
                :six, :seven, :eight, :nine

    def initialize(*data)
      data = data.sort_by(&:length).map { |n| n.split(//).sort }

      @one = data[0]
      @four = data[2]
      @seven = data[1]
      @eight = data[9]
    end
  end
end

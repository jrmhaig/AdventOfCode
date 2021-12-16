module PacketsStrategies
  class Eleven
    def initialize(builder)
      @builder = builder
    end

    def packets(bits)
      length = bits.shift(11).join.to_i(2)

      length.times.map { @builder.create_packet(bits) }
    end
  end
end


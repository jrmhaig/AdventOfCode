require 'bit_stream'

module PacketsStrategies
  class Fifteen
    def packets(bits)
      length = bits.shift(15).join.to_i(2)

      sub_bits = bits.shift(length)
      sub_bit_stream = BitStream.new(*sub_bits)
      @packets = sub_bit_stream.packets
    end
  end
end


module Packets
  class Literal
    attr_reader :version, :value

    def initialize(version, bits)
      @version = version
      literal_bits = bits.shift(5)
      while literal_bits[-5]  == '1'
        literal_bits += bits.shift(5)
      end

      @value = literal_bits.each_slice(5).map { |sl| sl[1..-1] }.flatten.join.to_i(2)
    end
  end
end

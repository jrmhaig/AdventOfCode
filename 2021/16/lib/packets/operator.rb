module Packets
  class Operator
    def initialize(version, bits, strategy)
      @version = version
      @packets = strategy.packets(bits)
    end

    def version = @version + @packets.sum(&:version)
  end
end

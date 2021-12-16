require 'packets/literal'
require 'packets/operator'
require 'packets_strategies/eleven'
require 'packets_strategies/fifteen'

class PacketCreator
  def initialize
    @eleven_strategy = PacketsStrategies::Eleven.new(self)
    @fifteen_strategy = PacketsStrategies::Fifteen.new
  end

  def create_packet(bits)
    version = bits.shift(3).join.to_i(2)
    type = bits.shift(3).join

    if type == '100'
      Packets::Literal.new(version, bits)
    else
      strategy = bits.shift == '0' ? @fifteen_strategy : @eleven_strategy
      Packets::Operator.new(version, bits, strategy)
    end
  end
end

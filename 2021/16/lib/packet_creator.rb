require 'packets/literal'
require 'packets/sum'
require 'packets/product'
require 'packets/minimum'
require 'packets/maximum'
require 'packets/greater_than'
require 'packets/less_than'
require 'packets/equal'
require 'packets_strategies/eleven'
require 'packets_strategies/fifteen'

class PacketCreator
  OPERATORS = {
    '000' => Packets::Sum,
    '001' => Packets::Product,
    '010' => Packets::Minimum,
    '011' => Packets::Maximum,
    '101' => Packets::GreaterThan,
    '110' => Packets::LessThan,
    '111' => Packets::Equal
  }

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
      OPERATORS[type].new(version, bits, strategy)
    end
  end
end

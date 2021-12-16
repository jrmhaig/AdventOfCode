require 'forwardable'
require 'packet_creator'

class BitStream
  extend Forwardable
  def_delegator :@bits, :shift

  attr_reader :packets

  def initialize(*bits)
    @packets = []
    @creator = PacketCreator.new
    while bits.select { |n| n == '1' }.any? do
      @packets << @creator.create_packet(bits)
    end
  end

  def version
    @packets.sum(&:version)
  end
end

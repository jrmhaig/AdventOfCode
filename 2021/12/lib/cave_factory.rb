require 'caves/terminus'
require 'caves/small'
require 'caves/big'

class CaveFactory
  def initialize(traveller:)
    @traveller = traveller
  end

  def create(id) = klass(id).new(id, traveller: @traveller)

  private

  def klass(id)
    return Caves::Terminus if ['start', 'end'].include?(id)
    return Caves::Big if /[[:upper:]]/.match(id)
    Caves::Small
  end
end

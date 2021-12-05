require 'factories/base'
require 'vents/vertical'
require 'vents/horizontal'
require 'vents/null_vent'

module Factories
  class One < Base
    private

    def klass(pos1, pos2)
      return Vents::Vertical if pos1[0] == pos2[0]
      return Vents::Horizontal if pos1[1] == pos2[1]

      Vents::NullVent
    end
  end
end

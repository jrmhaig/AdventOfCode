module Terminator
  module Ghost
    def self.check(node) = node.id[2] == 'Z'
  end
end
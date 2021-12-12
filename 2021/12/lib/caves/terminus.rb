require 'caves/base'

module Caves
  class Terminus < Base
    def available = !@visited
  end
end

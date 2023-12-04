$LOAD_PATH << File.expand_path('lib', __dir__)

require 'card'
require 'card_collection'

input = File.read('input.txt').split(/\n/)

collection = CardCollection.new(*input)
puts "Part 1: #{collection.value}"
puts "Part 2: #{collection.count}"

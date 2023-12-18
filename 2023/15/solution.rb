$LOAD_PATH << File.expand_path('lib', __dir__)

require 'step'

data = File.read('input.txt').chomp.split(/,/)

steps = data.map { |command| Step.new(command) }
total = steps.sum(&:hash)
puts "Part 1: #{total}"

steps.each { |step| step.hash_method = :code }
boxes = steps.each_with_object(Array.new(256) { [] }) do |step, bxs|
  box_id = step.hash
  lense_id = bxs[box_id].index { |contents| contents[:code] == step.code }
  if step.symbol == '='
    if lense_id
      bxs[box_id][lense_id][:focal_length] = step.focal_length
    else
      bxs[box_id].push({ code: step.code, focal_length: step.focal_length })
    end
  else
    bxs[box_id].delete_at(lense_id) if lense_id
  end
end

total = boxes.each_with_index.sum do |box, box_id|
  box.each_with_index.sum do |lense, slot_id|
    (box_id + 1) * (slot_id + 1) * lense[:focal_length]
  end
end

puts "Part 2: #{total}"

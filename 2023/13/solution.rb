$LOAD_PATH << File.expand_path('lib', __dir__)

require 'cluster'

clusters = File.read('input.txt').split(/\n\n/).map do |data|
  Cluster.new(*data.split(/\n/))
end

total = clusters.sum(&:h_mirror) * 100 + clusters.sum(&:v_mirror)
puts "Part 1: #{total}"

clusters.each { |cluster| cluster.smudges = 1 }
total = clusters.sum(&:h_mirror) * 100 + clusters.sum(&:v_mirror)
puts "Part 2: #{total}"

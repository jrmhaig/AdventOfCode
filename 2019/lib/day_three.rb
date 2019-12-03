class DayThree
  def initialize *paths
    @paths = paths
  end

  def closest_distance
    points = @paths.map do |path|
      pointer = [0, 0]
      pts = []
      steps = path.split(',').each do |step|
        (_, dir, len) = /([LRUD])(\d+)/.match(step).to_a
        len = len.to_i
        case dir
        when 'L'
          1.upto(len) { |i| pts << [pointer[0] - i, pointer[1]] }
          pointer[0] -= len.to_i
        when 'R'
          1.upto(len) { |i| pts << [pointer[0] + i, pointer[1]] }
          pointer[0] += len.to_i
        when 'U'
          1.upto(len) { |i| pts << [pointer[0], pointer[1] + i] }
          pointer[1] += len.to_i
        when 'D'
          1.upto(len) { |i| pts << [pointer[0], pointer[1] - i] }
          pointer[1] -= len.to_i
        end
      end
      pts
    end
    (points[0] & points[1]).map { |point| point.map(&:abs).sum }.min
  end
end

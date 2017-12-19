require 'advent_of_code/day_nineteen'

RSpec.describe AdventOfCode::DayNineteen do
  let(:maze) {
    AdventOfCode::DayNineteen.new <<MAZE
     |          
     |  +--+    
     A  |  C    
 F---|----E|--+ 
     |  |  |  D 
     +B-+  +--+ 
MAZE
  }

  describe '#trace' do
    it 'satisfies the example' do
      expect(maze.trace).to eq 'ABCDEF'
    end
  end

  describe '#step_count' do
    it 'satisfies the example' do
      maze.trace
      expect(maze.step_count).to eq 38
    end
  end
end

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
end

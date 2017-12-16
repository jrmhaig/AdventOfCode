require 'advent_of_code/day_sixteen'

RSpec.describe AdventOfCode::DaySixteen do
  let(:line) { AdventOfCode::DaySixteen.new ('a'..'e').to_a }
  describe 'step' do
    it 'satisfies the example' do
      expect{line.step 's1'}.to change(line, :order).from('abcde').to('eabcd')
      expect{line.step 'x3/4'}.to change(line, :order).from('eabcd').to('eabdc')
      expect{line.step 'pe/b'}.to change(line, :order).from('eabdc').to('baedc')
    end
  end

  describe 'dance' do
    it 'satisfies the example' do
      expect{line.dance('s1', 'x3/4', 'pe/b')}.to change(line, :order).from('abcde').to('baedc')
    end
  end
end

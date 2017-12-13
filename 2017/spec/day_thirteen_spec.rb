require 'advent_of_code/day_thirteen'

RSpec.describe AdventOfCode::DayThirteen do
  let(:firewall) {
    AdventOfCode::DayThirteen.new(
      0 => 3,
      1 => 2,
      4 => 4,
      6 => 4
    )
  }

  describe '#step' do
    it 'satisfies the example' do
      expect{firewall.step}.to change(firewall, :state).to(
        {
          0 => 1,
          1 => 1,
          4 => 1,
          6 => 1
        }
      )
      expect{firewall.step}.to change(firewall, :state).to(
        {
          0 => 2,
          1 => 0,
          4 => 2,
          6 => 2
        }
      )
      expect{firewall.step}.to change(firewall, :state).to(
        {
          0 => 1,
          1 => 1,
          4 => 3,
          6 => 3
        }
      )
    end
  end

  describe '#severity' do
    it 'satisfies the example' do
      expect(firewall.severity(0)).to eq 24
    end
  end

  describe '#safe_path' do
    it 'satisfies the example' do
      0.upto(9) do |i|
        expect(firewall.safe_path(i)).to be_falsey
      end
      expect(firewall.safe_path(10)).to be_truthy
    end
  end
end

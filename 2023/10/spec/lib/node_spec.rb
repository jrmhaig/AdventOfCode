require 'node'

RSpec.shared_examples 'find neighbours' do
  let!(:expected) { good.map { |coord| described_class.new(*coord, '.', nodes:) } }

  before do
    bad.each { |coord| described_class.new(*coord, '.', nodes:) }
  end

  it { is_expected.to contain_exactly(*expected) }
end

RSpec.describe Node do
  subject(:node) { described_class.new(x, y, mark, nodes:) }

  let(:nodes) { [] }
  let(:x) { 5 }
  let(:y) { 5 }

  describe '#neighbours' do
    subject { node.neighbours }

    it_behaves_like 'find neighbours' do
      let(:mark) { '-' }
      let(:good) { [[x - 1, y], [x + 1, y]] }
      let(:bad) { [[x, y - 1], [x, y + 1]] }
    end

    it_behaves_like 'find neighbours' do
      let(:mark) { '|' }
      let(:good) { [[x, y - 1], [x, y + 1]] }
      let(:bad) { [[x - 1, y], [x + 1, y]] }
    end

    it_behaves_like 'find neighbours' do
      let(:mark) { 'J' }
      let(:good) { [[x, y - 1], [x - 1, y]] }
      let(:bad) { [[x, y + 1], [x + 1, y]] }
    end

    it_behaves_like 'find neighbours' do
      let(:mark) { 'L' }
      let(:good) { [[x, y - 1], [x + 1, y]] }
      let(:bad) { [[x, y + 1], [x - 1, y]] }
    end

    it_behaves_like 'find neighbours' do
      let(:mark) { 'F' }
      let(:good) { [[x, y + 1], [x + 1, y]] }
      let(:bad) { [[x, y - 1], [x - 1, y]] }
    end

    it_behaves_like 'find neighbours' do
      let(:mark) { '7' }
      let(:good) { [[x, y + 1], [x - 1, y]] }
      let(:bad) { [[x, y - 1], [x + 1, y]] }
    end

    it_behaves_like 'find neighbours' do
      let(:mark) { '.' }
      let(:good) { [] }
      let(:bad) { [[x, y - 1], [x, y + 1], [x - 1, y], [x + 1, y]] }
    end

    context 'with S' do
      context 'with openings all round' do
        let(:mark) { 'S' }
        let!(:expected) do
          [
            described_class.new(x - 1, y, '-', nodes:),
            described_class.new(x + 1, y, 'J', nodes:),
            described_class.new(x, y - 1, '7', nodes:),
            described_class.new(x, y + 1, '|', nodes:)
          ]
        end

        it { is_expected.to contain_exactly(*expected) }
      end

      context 'with openings on some sides' do
        let(:mark) { 'S' }
        let!(:expected) do
          [
            described_class.new(x - 1, y, '-', nodes:),
            described_class.new(x, y + 1, '|', nodes:)
          ]
        end

        before do
          described_class.new(x + 1, y, 'L', nodes:)
          described_class.new(x, y - 1, '-', nodes:)
        end

        it { is_expected.to contain_exactly(*expected) }
      end
    end
  end
end

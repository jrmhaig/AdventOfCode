require 'node'

RSpec.describe Node do
  subject(:node) { described_class.new(id:, left:, right:, collection:).tap { |n| collection << n } }

  let(:id) { 'ABC' }
  let(:left) { 'LFT' }
  let!(:left_node) { described_class.new(id: left, left: nil, right: nil, collection:).tap { |n| collection << n } }
  let(:right) { 'RGT' }
  let!(:right_node) { described_class.new(id: right, left: nil, right: nil, collection:).tap { |n| collection << n } }
  let(:collection) { [] }

  describe '#go' do
    subject { node.go(direction) }

    context 'when going left' do
      let(:direction) { 'L' }

      it { is_expected.to eq left_node }
    end

    context 'when going right' do
      let(:direction) { 'R' }

      it { is_expected.to eq right_node }
    end
  end
end
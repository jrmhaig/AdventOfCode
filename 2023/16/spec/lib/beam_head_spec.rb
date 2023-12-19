require 'beam_head'
require 'matrix'

RSpec.describe BeamHead do
  subject(:beam_head) { BeamHead.new(position, direction) }

  let(:position) { Vector[5, 5] }

  describe '#reflect' do
    subject(:reflect) { beam_head.reflect(mirror) }

    context 'with a / mirror' do
      let(:mirror) { '/' }

      context 'when travelling right' do
        let(:direction) { Vector[1, 0] }

        it { expect { reflect }.to change(beam_head, :direction).from(Vector[1, 0]).to(Vector[0, -1]) }
      end

      context 'when travelling left' do
        let(:direction) { Vector[-1, 0] }

        it { expect { reflect }.to change(beam_head, :direction).from(Vector[-1, 0]).to(Vector[0, 1]) }
      end

      context 'when travelling up' do
        let(:direction) { Vector[0, -1] }

        it { expect { reflect }.to change(beam_head, :direction).from(Vector[0, -1]).to(Vector[1, 0]) }
      end

      context 'when travelling down' do
        let(:direction) { Vector[0, 1] }

        it { expect { reflect }.to change(beam_head, :direction).from(Vector[0, 1]).to(Vector[-1, 0]) }
      end
    end

    context 'with a \ mirror' do
      let(:mirror) { '\\' }

      context 'when travelling right' do
        let(:direction) { Vector[1, 0] }

        it { expect { reflect }.to change(beam_head, :direction).to(Vector[0, 1]) }
      end

      context 'when travelling left' do
        let(:direction) { Vector[-1, 0] }

        it { expect { reflect }.to change(beam_head, :direction).to(Vector[0, -1]) }
      end

      context 'when travelling up' do
        let(:direction) { Vector[0, -1] }

        it { expect { reflect }.to change(beam_head, :direction).to(Vector[-1, 0]) }
      end

      context 'when travelling down' do
        let(:direction) { Vector[0, 1] }

        it { expect { reflect }.to change(beam_head, :direction).to(Vector[1, 0]) }
      end
    end
  end
end

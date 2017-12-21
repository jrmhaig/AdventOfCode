require 'matrix'

RSpec.describe 'vectors' do
  let(:vectors) { [{ a: Vector[1, 2] }] }

  it 'adds to the vector' do
    expect { vectors[0][:a] += Vector[1, 1] }
      .to change{vectors}
      .to( [{a: Vector[2, 3]}] )
  end
end

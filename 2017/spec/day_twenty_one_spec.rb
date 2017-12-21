require 'advent_of_code/day_twenty_one'

RSpec.describe AdventOfCode::DayTwentyOne do
  let(:grid) {
    AdventOfCode::DayTwentyOne.new(
      '../.# => ##./#../...',
      '.#./..#/### => #..#/..../..../#..#'
    )
  }

  describe '#split' do
    it 'splits a grid divisible by 2' do
      expect(grid.split(
        Matrix[
          [1,0,0,1],
          [0,0,0,0],
          [0,0,0,0],
          [1,0,0,1]
        ]
      )).to eq(
        [
          [
            Matrix[[1,0], [0,0]],
            Matrix[[0,1], [0,0]]
          ],
          [
            Matrix[[0,0], [1,0]],
            Matrix[[0,0], [0,1]]
          ]
        ]
      )
    end

    it 'splits a grid divisible by 3' do
      expect(grid.split(
        Matrix[
          [1,1,1,0,1,0,1,0,1],
          [0,0,0,0,0,0,0,0,0],
          [1,0,1,0,1,0,1,0,1],
          [0,0,0,1,0,0,0,0,0],
          [1,0,1,0,1,0,1,0,1],
          [0,0,0,0,0,0,0,0,0],
          [1,0,1,0,1,1,1,0,1],
          [0,0,0,0,0,0,0,0,0],
          [1,0,1,0,1,0,1,0,1]
        ]
      )).to eq(
        [
          [
            Matrix[[1,1,1], [0,0,0], [1,0,1]],
            Matrix[[0,1,0], [0,0,0], [0,1,0]],
            Matrix[[1,0,1], [0,0,0], [1,0,1]],
          ],
          [
            Matrix[[0,0,0], [1,0,1], [0,0,0]],
            Matrix[[1,0,0], [0,1,0], [0,0,0]],
            Matrix[[0,0,0], [1,0,1], [0,0,0]],
          ],
          [
            Matrix[[1,0,1], [0,0,0], [1,0,1]],
            Matrix[[0,1,1], [0,0,0], [0,1,0]],
            Matrix[[1,0,1], [0,0,0], [1,0,1]],
          ]
        ]
      )
    end

    it 'splits a grid divisible by 6' do
      expect(grid.split(
        Matrix[
          [1,0,1,0,1,0],
          [0,0,0,0,0,0],
          [1,0,1,0,1,0],
          [0,0,0,0,0,0],
          [1,0,1,0,1,0],
          [0,0,0,0,0,0]
        ]
      )).to eq(
        [
          [
            Matrix[[1,0], [0,0]],
            Matrix[[1,0], [0,0]],
            Matrix[[1,0], [0,0]]
          ],
          [
            Matrix[[1,0], [0,0]],
            Matrix[[1,0], [0,0]],
            Matrix[[1,0], [0,0]]
          ],
          [
            Matrix[[1,0], [0,0]],
            Matrix[[1,0], [0,0]],
            Matrix[[1,0], [0,0]]
          ]
        ]
      )
    end
  end

  describe '#join' do
    it 'joins a grid' do
      expect(grid.join(
        [
          [
            Matrix[[1,0], [0,0]],
            Matrix[[0,1], [0,0]],
            Matrix[[0,0], [1,0]]
          ],
          [
            Matrix[[0,1], [0,0]],
            Matrix[[0,0], [1,0]],
            Matrix[[0,0], [0,1]]
          ],
          [
            Matrix[[0,0], [1,0]],
            Matrix[[0,0], [0,1]],
            Matrix[[1,0], [0,0]]
          ]
        ]
      )).to eq(
        Matrix[
          [1,0,0,1,0,0],
          [0,0,0,0,1,0],
          [0,1,0,0,0,0],
          [0,0,1,0,0,1],
          [0,0,0,0,1,0],
          [1,0,0,1,0,0]
        ]
      )
    end
  end

  describe '#transform' do
    it 'transforms based on correct orientation' do
      expect(grid.transform(Matrix[[0, 1, 0], [0, 0, 1], [1, 1, 1]]))
        .to eq(Matrix[[1, 0, 0, 1], [0, 0, 0, 0], [0, 0, 0, 0], [1, 0, 0, 1]])
    end

    it 'transforms based on rotated pattern' do
      expect(grid.transform(Matrix[[1, 0, 0], [1, 0, 1], [1, 1, 0]]))
        .to eq(Matrix[[1, 0, 0, 1], [0, 0, 0, 0], [0, 0, 0, 0], [1, 0, 0, 1]])
    end

    it 'transforms based on flipped pattern' do
      expect(grid.transform(Matrix[[1, 1, 1], [0, 0, 1], [0, 1, 0]]))
        .to eq(Matrix[[1, 0, 0, 1], [0, 0, 0, 0], [0, 0, 0, 0], [1, 0, 0, 1]])
    end

  end
end

require_relative "piece.rb"
require_relative "board.rb"

class Pawn < Piece

  def initialize(color,position,board)
    super
    @moved = false
  end

  def moves
    x, y  = position

    result = [[x + 1, y]]

    result << [x + 2, y] unless @moved
    # result << [x + 1, y + 1] if board[[x + 1, y + 1]].enemy?
    # result << [x - 1, y + 1] if board[[x - 1, y + 1]].enemy?
    result.concat(diagonals)
    result
  end

  def move(new_position)
    @moved = true
    super
  end

  def diagonals
    x, y = position

    [[x + 1, y + 1], [x + 1, y - 1]].select do |move|
      board.occupied?(move) && !same_color?(board[move])
    end
  end






end

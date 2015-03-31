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
    result
  end

  def move(new_position)
    @moved = true
    super
  end




end

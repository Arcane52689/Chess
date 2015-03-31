require_relative "Piece.rb"

class Pawn< Piece

  def initialize(color,position,board)
    super
    @moved = false
  end



  def moves
    x, y  = position

    result = [[x, y + 1]]

    result << [x, y + 2] unless moved
    result << [x + 1, y + 1] if board[x + 1, y + 1].enemy?
    result << [x - 1, y + 1] if board[x - 1, y + 1].enemy?
    result
  end




end

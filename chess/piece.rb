


class Piece
  attr_reader :color, :board
  attr_accessor :position

  def initialize(color,position,board)
    @color = color
    @position = position
    @board = board
  end

  def moves
    raise "Why are you here?"
  end

  def same_color?(other_piece)
    color == other_piece.color
  end


  

end

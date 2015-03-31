require_relative "board.rb"


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

  def move(new_position)
    self.position = new_position
  end


  def in_board?(pos)
    x, y = pos
    x.between?(0,7) && y.between?(0,7)
  end

  def dup(dup_board)
    dup_board[@position] = self.class.new(@color, @position, dup_board)
  end


end

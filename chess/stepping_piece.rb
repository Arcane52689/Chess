require_relative "piece.rb"
require_relative "board.rb"

class SteppingPiece < Piece

  def moves
    result = []
    x, y = position
    move_dirs.each do |(dx, dy)|
      new_position = [x + dx, y + dy]
      if in_board?(new_position)
        result << new_position if check_space(new_position)
      end
    end

    result
  end

  def move_dirs
    [[0,1]]
  end

  def check_space(pos)
    !board.occupied?(pos) || !same_color?(board[pos])
  end




end

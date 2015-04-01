class SteppingPiece < Piece

  def moves
    result = []
    x, y = position
    move_dirs.each do |(dx, dy)|
      new_position = [x + dx, y + dy]
      result << new_position if check_space(new_position)
    end

    result
  end

  def move_dirs
    raise "NOT IMPLEMENTED"
  end

  def check_space(pos)
    in_board?(new_position) &&
      (!board.occupied?(pos) || !same_color?(board[pos]))
  end




end

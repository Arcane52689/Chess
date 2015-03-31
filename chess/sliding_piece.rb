require_relative "piece.rb"
require_relative "board.rb"

class SlidingPiece < Piece

  def moves
    result = []
    x, y = position
    move_dirs.each do |(dx, dy)|
      temp_moves = []
      1.upto(7) do |multiplier|
        new_position = [x + dx * multiplier, y + dy * multiplier]
        break unless board.in_board?(new_position)
        temp_moves << new_position
        break if board.occupied?(new_position)

      end
      #p temp_moves
      next if temp_moves.empty?
      if board.occupied?(temp_moves.last)

        temp_moves.pop if same_color?(board[temp_moves.last])
      end
      result.concat(temp_moves)
    end

    result
  end


  def move_dirs
    [[-1,1],[1,-1]]
  end

end

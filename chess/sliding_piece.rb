require_relative "Piece.rb"

class SlidingPiece < Piece

  def moves
    result = []
    x, y = position
    move_dirs.each do |(dx, dy)|
      1.upto(7) do |multiplier|
        new_position = [x + dx * multiplier, y + dy * multiplier]
        result << new_position
      end
    end

    result
  end


  def move_dirs
    #NOT IMPLEMENTED
  end

end

require_relative "Piece.rb"

class SteppingPiece < Piece

  def move
    result = []
    x, y = position
    move_dirs.each do |(dx, dy)|
      new_position = [x + dx, y + dy]
      result << new_position
    end

    result
  end

  def move_dirs

  end




end

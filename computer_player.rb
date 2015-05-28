
class ComputerPlayer

  attr_accessor :color, :name, :board

  def initialize()
    @name = "CompChess1009"
  end

  def set_color(color)
    self.color = color
  end

  def set_board(board)
    @board = board
  end

  def get_move
    @current_piece = pick_piece
    [@current_piece.position, get_end]
  end



  def get_start
    @current_piece = pick_piece
    return @current_piece.position
  end

  def get_end
    if @current_piece.capturing_moves.any?
      return @current_piece.capturing_moves.first
    else
      return @current_piece.valid_moves.shuffle.first
    end
  end

  def pick_piece
    if capturing_pieces.any?
      return capturing_pieces.shuffle.first
    else
      return valid_pieces.shuffle.first
    end
  end


  def pieces
    board.find_pieces(color)
  end

  def valid_pieces
    pieces.select{ |piece| piece.valid_moves.any? }
  end


  def capturing_pieces
    pieces.select { |piece| piece.capturing_moves.any? }
  end


  def convert_position(position)
    col = MOVE_HASH[position[0]]
    row = position[1].to_i - 1
    [row, col]
  end

  def inspect
    [name, color].inspect
  end

end

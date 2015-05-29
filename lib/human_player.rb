
class HumanPlayer

  attr_accessor :color, :name, :board

  MOVE_HASH = {
    "A" => 0,
    "B" => 1,
    "C" => 2,
    "D" => 3,
    "E" => 4,
    "F" => 5,
    "G" => 6,
    "H" => 7
  }

  CONVERTER = {
    0 => "A",
    1 => "B",
    2 => "C",
    3 => "D",
    4 => "E",
    5 => "F",
    6 => "G",
    7 => "H"
  }


  START_PROMPT = "Please enter the position of the piece you would like to move"
  END_PROMPT = "Please enter the position you would like to move that piece to"

  def initialize(name)
    @name = name
  end

  def set_color(color)
    self.color = color
  end


  def set_board(board)
    @board = board
  end

  def ask_move(prompt)
    puts prompt
    STDIN.gets.chomp.upcase.split("")
  end

  def get_start
    convert_position(ask_move(START_PROMPT))
  end

  def get_end
    convert_position(ask_move(END_PROMPT))
  end

  def convert_position(position)
    col = MOVE_HASH[position[0]]
    row = position[1].to_i - 1
    [row, col]
  end

  def inspect
    [name, color].inspect
  end


  def get_move
    start_pos = get_start
    if converted_moves(board[start_pos]).empty?
      raise InvalidInputError.new INVALID_MOVE_ERROR
    end
    p converted_moves(board[start_pos])
    end_pos = get_end

    [start_pos, end_pos]
  end

  def converted_moves(piece)
    piece.valid_moves.map do |row,col|
      CONVERTER[col] + (row + 1).to_s
    end
  end

end

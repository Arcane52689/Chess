
class HumanPlayer

  attr_accessor :color, :name

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

  def initialize(name)
    @name = name
  end

  def set_color(color)
    self.color = color
  end

  def get_move
    start_pos = gets.chomp.split("")
    end_pos = gets.chomp.split("")
    [start_pos, end_pos].map { |position| convert_position(position) }
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

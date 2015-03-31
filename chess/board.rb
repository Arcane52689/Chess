

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }

  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos,piece)
    x, y = pos
    grid[x][y] = piece
  end

  def in_check?(color)
    position = find_king(color)
    pieces = find_pieces(swap(color))
    pieces.any? { |piece| piece.moves.include?(position) }
  end

  def find_king(color)
    8.times do |x|
      8.times do |y|
        return [x,y] if grid[x][y].color == color && grid[x][y].is_a?(King)
      end
    end
  end

  def swap(color)
    color == :white ? :black : :white
  end

  def find_pieces(color)
    result = []
    8.times do |x|
      8.times do |y|
        result << grid[x][y] if grid[x][y].color == color
      end
    end

    result
  end


  def move(start, end_pos)
    raise "NO PIECE HERE" if self[start].nil?
    piece = self[start]
    raise "CAN'T MOVE THERE" unless piece.moves.include?(end_pos)
    self[end_pos] = piece
    self[start] = nil
  end

  def in_board?(pos)
    x, y = pos
    x.in_between?(0,7) && y.in_between?(0,7)
  end

  def occupied?(pos)
    !self[pos].nil?
  end


end

require_relative "pawn.rb"
require_relative "king.rb"
require_relative "knight.rb"

class Board
  attr_accessor :grid

  def self.test_board
    board = Board.new
    board[[0,0]] = Pawn.new(:white,[0,0], self)
    board[[0,4]] = King.new(:white,[0,4], self)
    board[[1,6]] = Knight.new(:black, [1,6], self)
    board
  end

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
        next if grid[x][y].nil?
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
        next if grid[x][y].nil?
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
    piece.move(end_pos)
    self[start] = nil
  end



  def occupied?(pos)
    !self[pos].nil?
  end


end

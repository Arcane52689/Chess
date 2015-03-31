require_relative "piece.rb"
require_relative "pawn.rb"
require_relative "king.rb"
require_relative "knight.rb"

class Board
  attr_accessor :grid

  def self.test_board
    board = Board.new
    Pawn.new(:white,[1,0], board)
    King.new(:white,[0,4], board)
    Knight.new(:black, [3,6], board)
    Pawn.new(:black, [2,1], board)
    board
  end

  def initialize(grid= Array.new(8) { Array.new(8) })
    @grid = grid

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

  def move!(start, end_pos)
    raise "NO PIECE HERE" if self[start].nil?
    piece = self[start]
    raise "CAN'T MOVE THERE" unless piece.moves.include?(end_pos)
    self[end_pos] = piece
    piece.move(end_pos)
    self[start] = nil
  end

  def dup
    dup_board = Board.new
    grid.each do |row|
      row.each do |piece|
        piece.dup(dup_board) unless piece.nil?
      end
    end
    dup_board
  end


  def occupied?(pos)
    !self[pos].nil?
  end


end

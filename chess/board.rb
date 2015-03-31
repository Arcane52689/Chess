class Board
  attr_accessor :grid


  def self.game_board
    board = Board.new
    board.place_kings
    board.place_queens
    board.place_bishops
    board.place_knights
    board.place_rooks
    board.place_pawns
    board
  end

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
    raise "CAN'T MOVE THERE" unless piece.valid_moves.include?(end_pos)
    self[end_pos] = piece
    piece.move(end_pos)
    self[start] = nil
  end

  def move!(start, end_pos)
    # for checking if move will leave player in check
    # only called in a pieces#valid_moves
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

  def render
    grid.map { |row| render_row(row) }
  end

  def render_row(row)
    row.map do |piece|
      if piece.nil?
        "\u25A1"
      else
        piece.render
      end
    end.join
  end

  def checkmate?(color)
    in_check?(color) || no_valid_moves_left?(color)
  end

  def no_valid_moves_left(color)
    find_pieces(color).none? { |piece| piece.valid_moves.any? }
  end




  #beginning placement methods
  # will be private
  def place_pawns
    8.times do |i|
      Pawn.new(:white, [1,i], self)
      Pawn.new(:black, [6,i], self)
    end
  end

  def place_bishops
    Bishop.new(:white, [0,2], self)
    Bishop.new(:white, [0,5], self)
    Bishop.new(:black, [7,2], self)
    Bishop.new(:black, [7,5], self)
  end

  def place_knights
    Knight.new(:white, [0,1], self)
    Knight.new(:white, [0,6], self)
    Knight.new(:black, [7,1], self)
    Knight.new(:black, [7,6], self)
  end

  def place_rooks
    Rook.new(:white, [0,0], self)
    Rook.new(:white, [0,7], self)
    Rook.new(:black, [7,0], self)
    Rook.new(:black, [7,7], self)
  end

  def place_kings
    King.new(:white, [0,3], self)
    King.new(:black, [7,3], self)
  end

  def place_queens
    Queen.new(:white, [0,4], self)
    Queen.new(:white, [7,4], self)
  end

end

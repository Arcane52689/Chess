class Pawn < Piece
  attr_accessor :dx
  def initialize(color,position,board)
    super
    @moved = false
    color == :white ? @dx = 1 : @dx = -1
  end

  def moves
    x, y  = position

    result = [[x + dx, y]]

    result << [x + 2 * dx, y] unless @moved
    result.select! { |result| check_move(result) }
    # result << [x + 1, y + 1] if board[[x + 1, y + 1]].enemy?
    # result << [x - 1, y + 1] if board[[x - 1, y + 1]].enemy?
    result.concat(diagonals)
    result
  end



  def check_move(move)
    in_board?(move) && !board.occupied?(move)
  end


  def move(new_position)
    @moved = true
    super
  end

  def diagonals
    x, y = position

    [[x + dx, y + 1], [x + dx, y - 1]].select do |move|
      board.occupied?(move) && !same_color?(board[move])
    end
  end

  def render
    color == :white ? "\u2659" : "\u265F"
  end






end

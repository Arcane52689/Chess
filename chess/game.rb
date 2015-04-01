require_relative 'load_file.rb'
require "Byebug"
class Game

  attr_accessor  :player1, :player2, :current_player, :board

  def self.testing
    sj = HumanPlayer.new("sj")
    thomas  = HumanPlayer.new("thomas")
    Game.new(sj, thomas).play
  end

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    player1.set_color(:white)
    player2.set_color(:black)
    @current_player = player1
    @board = Board.game_board
  end

  def get_move
    current_player.get_move
  end

  def play
    loop do
      break if game_over?
      play_turn
      self.current_player = next_player
    end
    winner
  end

  def next_player
    current_player == player1 ? player2 : player1
  end

  def game_over?
    board.no_valid_moves_left?(current_player.color)
  end

  def display_board
    puts board.display
    puts "#{current_player.name}, it's your turn"
  end

  def play_turn
    begin
      display_board
      puts "CHECK!" if board.in_check?(current_player.color)
      move = get_move
      board.move(move[0],move[1], current_player.color)
    rescue
       p $!, *$@
      retry
    end
  end

  def winner
    if board.checkmate?(current_player.color)
      puts "CHECKMATE! #{next_player.name} WINS!"
    else
      puts "IT'S A DRAW!"
    end
  end

end

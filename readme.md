##Chess



### How to Play
First, enter the chess directory in Terminal.  Then run ruby game.rb to play a game vs. the computer.  To play a game with another human, simply run ruby game.rb human.  If you'd like to watch the computer play itself, run ruby game.rb comp.



### Interesting Code
+ Custom dup method for board and pieces, in which the pieces duplicate places itself on the duplicate board, eliminating the need to loop over the entire board.
+ SlidingPiece#move utilizes two functions. One to find all the available moves in a direction, and another to keep track of all those moves.  To  eliminate as much code as possible, the second function checks whether the last element in each move list is occupied by an ally and removes it.  T
+ The computer player currently selects any pieces that can capture, and picks a capture at random. If that's not available, it will select a move at random.

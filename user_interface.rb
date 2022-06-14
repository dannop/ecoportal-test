class UserInterface 
  def render_board(board) 
    puts " #{board[0]} | #{board[1]} | #{board[2]} \n===+===+===\n #{board[3]} | #{board[4]} | #{board[5]} \n===+===+===\n #{board[6]} | #{board[7]} | #{board[8]} \n"
  end

  def ask_next_move
    puts "Enter [0-8]:"
  end

  def game_over
    puts "Game over"
  end

  def invalid_entry
    puts "Invalid entry"
  end

  def the_winner(winner)
    puts "Winner is #{winner}"
  end

  def game_tied
    puts "Game tied"
  end
end
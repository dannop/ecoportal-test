class UserInterface 
  def render_main_menu
    puts "Select game mode [0-2]:\n0: Player vs Computer\n1: Player vs Player\n2: Computer vs Computer"
  end

  def render_difficulty
    puts "Select difficulty [0-3]:\n0: Easy\n1: Medium\n2: Hard\n3: Back"
  end
  
  def render_board(board) 
    puts " #{board[0]} | #{board[1]} | #{board[2]} \n===+===+===\n #{board[3]} | #{board[4]} | #{board[5]} \n===+===+===\n #{board[6]} | #{board[7]} | #{board[8]} \n"
  end

  def ask_next_move(marker)
    puts "#{marker} player enter [0-8]:"
  end

  def current_turn(marker)
    puts "#{marker} turn"
  end

  def game_over
    puts "Game over"
  end

  def invalid_entry
    puts "Invalid entry, please verify current options"
  end

  def you_win
    puts "\nYou win!\n"
  end

  def game_tied
    puts "Game tied"
  end
end
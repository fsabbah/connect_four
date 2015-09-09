require_relative 'game_board'

module ConnectFour

  def self.hello_world
    "hello world"
  end

  private
  def self.get_player_input(player)
    puts "Player#{player}>"
    loop do
      input = gets.chomp
      begin
        selected_column = Integer(input)
        if selected_column >= 1 and selected_column <= 8
          return selected_column - 1
        else
          puts 'invalid input. column number must be between 1-8'
        end
      rescue ArgumentError
        puts 'invalid input. column number must be between 1-8'
      end
    end
  end

  def self.start_game
    game_board = GameBoard.new
    puts "Game Started!"

    game_board.draw_board

    random_player_selection = [true, false].sample
    full = nil
    winner = nil

    loop do
      if random_player_selection
        player = 'x'
      else
        player = 'o'
      end

      loop do
        if game_board.is_full
          break
        end
        column = get_player_input player
        success_add_operation = game_board.add_movement player, column
        break if success_add_operation
        puts "Column #{column + 1} is full try another one!"
      end

      game_board.draw_board
      winner = game_board.get_winner
      full = game_board.is_full
      random_player_selection = !random_player_selection
      break if winner != 'nobody' || full
    end

    if full
      puts "Game is draw!"
    else
      puts "Game finished, Winner is #{winner}"
    end

  end

end

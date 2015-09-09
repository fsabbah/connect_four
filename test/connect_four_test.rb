require 'test_helper'
require_relative '../lib/game_board'

class ConnectFourTest < ConnectFourSpec

  def setup
    @game_board = GameBoard.new
    @playerx = 'x'
    @playero = 'o'
  end

  def test_hello_world
    assert_equal "hello world", ConnectFour.hello_world
  end

  def test_add_movement
    random_col = rand(7)
    @game_board.add_movement @playerx, random_col
    assert_equal @playerx, @game_board.get_game_array[0][random_col]
  end

  def test_add_movement_to_full_column
    col = 1
    for i in 0..7
      @game_board.add_movement @playerx, col
    end
    last_movement = @game_board.add_movement @playerx, col
    assert_equal false, last_movement
  end

  def test_is_full
    for i in 0..7
      for j in 0..7
        @game_board.add_movement @playerx, j
      end
    end
    assert_equal true, @game_board.is_full
  end

  def test_get_winner_in_rows
    for i in 0..3
      @game_board.add_movement @playerx, i
    end
    assert_equal @playerx, @game_board.get_winner
  end

  def test_get_winner_in_columns
    for i in 0..3
      @game_board.add_movement @playerx, 0
    end
    assert_equal @playerx, @game_board.get_winner
  end

  def test_get_winner_in_left_diagonal
    for i in 0..2
      @game_board.add_movement @playero, 0
    end
    @game_board.add_movement @playerx, 0
    for i in 0..1
      @game_board.add_movement @playero, 1
    end
    @game_board.add_movement @playerx, 1

    @game_board.add_movement @playero, 2
    @game_board.add_movement @playerx, 2
    @game_board.add_movement @playerx, 3
    assert_equal @playerx, @game_board.get_winner
  end

  def test_get_winner_in_right_diagonal
    for i in 0..2
      @game_board.add_movement @playero, 7
    end
    @game_board.add_movement @playerx, 7
    for i in 0..1
      @game_board.add_movement @playero, 6
    end
    @game_board.add_movement @playerx, 6

    @game_board.add_movement @playero, 5
    @game_board.add_movement @playerx, 5
    @game_board.add_movement @playerx, 4
    assert_equal @playerx, @game_board.get_winner
  end

end

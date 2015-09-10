class GameBoard
  def initialize
    @game_array = Array.new(8) { Array.new(8) { '.' } }
  end

  def get_game_array
    return @game_array
  end

  def add_movement(player, column)
    (@game_array[column].length).times { |index|
      if @game_array[index][column] == '.'
        @game_array[index][column] = player
        return true
      end
    }
    return false
  end

  def draw_board
    table_header = *('1'..'8')
    puts table_header.each { |ele| ele }.join(' ')
    puts '---------------'
    @game_array.reverse.each do |row|
      puts row.each { |ele| ele }.join(' ')
    end
  end

  def get_winner
    winner_in_rows = get_winner_in_rows
    if winner_in_rows != "nobody"
      return winner_in_rows
    end

    winner_in_columns = get_winner_in_columns
    if winner_in_columns != "nobody"
      return winner_in_columns
    end

    winner_in_left_diagonal = get_winner_in_left_diagonal
    if winner_in_left_diagonal != "nobody"
      return winner_in_left_diagonal
    end

    winner_in_right_diagonal = get_winner_in_right_diagonal
    if winner_in_right_diagonal != "nobody"
      return winner_in_right_diagonal
    end

    return "nobody"
  end

  def get_winner_in_rows
    x = 0
    o = 1
    counter = Array.new(2) { 0 }

    @game_array.each do |row|
      (row.length).times do |index|
        if row[index] == 'x'
          counter[x] += 1
          counter[o] = 0
          if counter[x] >= 4
            return 'x'
          end
        elsif row[index] == 'o'
          counter[o] +=1
          counter[x] = 0
          if counter[o] >= 4
            return 'o'
          end
        else
          counter = [0, 0]
        end
      end
    end
    return "nobody"
  end

  def get_winner_in_columns
    x = 0
    o = 1
    counter = Array.new(2) { 0 }

    (@game_array.length).times do |i|
      (@game_array[i].length).times do |j|
        if @game_array[j][i] == 'x'
          counter[x] += 1
          counter[o] = 0
          if counter[x] >= 4
            return 'x'
          end
        elsif @game_array[j][i] == 'o'
          counter[o] +=1
          counter[x] = 0
          if counter[o] >= 4
            return 'o'
          end
        else
          counter = [0, 0]
        end
      end
      counter = [0, 0]
    end
    return "nobody"
  end

  def get_winner_in_right_diagonal
    x = 0
    o = 1
    counter = Array.new(2) { 0 }

    (@game_array.length * 2).times do |k|
      (k+1).times do |j|
        i = k - j;
        if i < @game_array.length && j < @game_array.length
          if @game_array[i][j] == 'x'
            counter[x] += 1
            counter[o] = 0
            if counter[x] >= 4
              return 'x'
            end
          elsif @game_array[i][j] == 'o'
            counter[o] +=1
            counter[x] = 0
            if counter[o] >= 4
              return 'o'
            end
          else
            counter = [0, 0]
          end
        end
      end
      counter = [0, 0]
    end
    return "nobody"
  end

  def get_winner_in_left_diagonal
    x = 0
    o = 1
    counter = Array.new(2) { 0 }

    (@game_array.length * 2).times do |k|
      (k+1).times do |j|
        i = k - j
        if i < @game_array.length && j < @game_array.length
          if @game_array[i][@game_array.length-1 - j] == 'x'
            counter[x] += 1
            counter[o] = 0
            if counter[x] >= 4
              return 'x'
            end
          elsif @game_array[i][@game_array.length-1 - j] == 'o'
            counter[o] +=1
            counter[x] = 0
            if counter[o] >= 4
              return 'o'
            end
          else
            counter = [0, 0]
          end
        end
      end
      counter = [0, 0]
    end
    return "nobody"
  end

  def is_full
    @game_array.each do |row|
      if row.include? '.'
        return false
      end
    end
    return true
  end
end

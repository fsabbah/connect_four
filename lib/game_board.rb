class GameBoard
  def initialize
    @game_array = Array.new(8) { Array.new(8) { '.' } }
  end

  def get_game_array
    return @game_array
  end

  def add_movement(player, column)
    for index in (0...@game_array[column].length)
      if @game_array[index][column] == '.'
        @game_array[index][column] = player
        return true
      end
    end
    return false
  end

  def draw_board
    @game_array.reverse.each do |row|
      puts row.each { |ele| ele }.join(' ')
    end
  end

  def get_winner
    x = 0
    o = 1
    counter = Array.new(2) { 0 }

    # Check the winner in rows
    @game_array.each do |row|
      for index in 0...row.length
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
      counter = [0, 0]
    end

    # Check the winner in columns
    for i in 0...@game_array.length
      for j in 0...@game_array[i].length
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

    # Check the winner in right diagonal
    for k in 0...@game_array.length * 2
      for j in 0...k+1
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

    # Check the winner in left diagonal
    for k in 0...@game_array.length * 2
      for j in 0...k+1
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

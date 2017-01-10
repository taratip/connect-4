class Board
  ALPHABET_ROW = [" ", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", " "]
  attr_reader :rows

  def initialize
    @board = []
    10.times do
      row = []
      10.times do
        row << nil
      end
      @board << row
    end
  end

  def rows
    @board
  end

  def add_turn(player, col_name)
    alphabet_index = ALPHABET_ROW.index(col_name) - 1
    available_row = 0
    spot_available = false
    @board.reverse.each_with_index do |row, row_index|
      row.each_with_index do |column, col_index|
        if col_index == alphabet_index
          if column.nil?
            available_row = row_index
            spot_available = true
            break
          end
        end
      end
      break if (spot_available)
    end

    row = 9 - available_row
    @board[row][alphabet_index] = player
  end

  def print
    board_print = ""
    @board.each_with_index do |row, index|
      spots = [ ]
      spots << '|'
      row.each do |space|
        if space.nil?
          spots << ' '
        else
          spots << space
        end
      end
      spots << '|'
      board_print << spots.join(' ') + "\n"
    end
    board_print << ALPHABET_ROW.join(' ') + "\n"
    board_print
  end

  def empty_space_in_vertical?(col_name)
    alphabet_index = ALPHABET_ROW.index(col_name) - 1
    @board.each do |row|
      return true if row[alphabet_index].nil?
    end

    return false
  end

  def empty_space?
    @board.each do |row|
      row.each do |col|
        return true if col.nil?
      end
    end

    return false
  end

  def winner?(character, col_name)
    if vertical_win?(character, col_name)
      return true
    else
      if row_win?(character)
        return true
      else
        return false
      end
    end
  end

  def vertical_win?(character, col_name)
    #check column of 4 pieces consecutively
    alphabet_index = ALPHABET_ROW.index(col_name) - 1
    pre_row_index = 0
    col_consecutive = 0

    @board.reverse.each_with_index do |row, row_index|
      if !row[alphabet_index].nil? && row[alphabet_index] == character
        if pre_row_index == row_index - 1 || col_consecutive == 0 || row_index == 0
          col_consecutive += 1
          pre_row_index = row_index
          if col_consecutive == 4
            return true
          end
        else
          col_consecutive = 0
        end
      else
        col_consecutive = 0
      end
    end
    return false
  end

  def row_win?(character)
    #check row line of 4 pieces consecutively
    @board.each do |row|
      pre_col_index = 0
      row_consecutive = 0

      row.each_with_index do |col, col_index|
        if !col.nil? && col == character
          if pre_col_index == col_index - 1 || col_index == 0 || row_consecutive == 0
            row_consecutive += 1
            pre_col_index = col_index
            if row_consecutive == 4
              return true
            end
          else
            row_consecutive = 0
          end
        else
          row_consecutive = 0
        end
      end
    end
    return false
  end
end

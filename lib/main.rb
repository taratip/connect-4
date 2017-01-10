require_relative 'board'
require_relative 'player'

COLUMNS = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]

unique_name = false

puts "Can I have name for the first player? "
x_name = gets.chomp

while !unique_name do
  puts "Can I have name for the second player? "
  o_name = gets.chomp

  if o_name.downcase == x_name.downcase
    unique_name = false
    puts "The name must be uniqe!"
  else
    unique_name = true
  end
end

x_player = Player.new(x_name, 'x')
o_player = Player.new(o_name, 'o')

continue = "y"

while continue == "y" do
  players = [x_player, o_player].shuffle
  turn_index = 0

  board = Board.new
  has_winner = false

  while board.empty_space? && !has_winner do
    puts "\nIt is #{players[turn_index].name} turn "

    invalid_input = false

    while !invalid_input do
      print "\nWhat column do you want to play? "
      column = gets.chomp.upcase

      if COLUMNS.index(column) == nil
        puts "Invalid column, please enter between 'A' to 'J'"
        invalid_input = false
      else
        if board.empty_space_in_vertical?(column)
          board.add_turn(players[turn_index].character,column)
          invalid_input = true
        else
          puts "The column is full, please select another column."
          invalid_input = false
        end
      end
    end

    puts "\n"
    puts board.print
    #check if the player wins
    has_winner = board.winner?(players[turn_index].character,column)
    break if has_winner

    turn_index = turn_index == 0 ? 1 : 0
  end

  if has_winner
    puts "\nPlayer #{players[turn_index].name} wins!"
  else
    puts "\nIt's a draw!"
  end

  print "\nDo you want to play again? (Y/N) "

  while
    continue = gets.chomp.downcase

    if continue != "y" && continue != "n"
      print "Invalid input, please enter Y or N: "
    else
      break
    end
  end
end

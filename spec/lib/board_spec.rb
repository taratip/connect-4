require 'spec_helper'

require_relative '../../lib/board'

describe Board do
  it 'can be initialized with 10 rows and columns by default' do
    board = Board.new
    expect(board.rows.size).to eq(10)
    expect(board.rows[0].size).to eq(10)
  end

  describe '#print' do
    it 'prints 10 rows and columns for a 10 row board' do
      board = Board.new
      board_print =
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "  A B C D E F G H I J  \n"
      expect(board.print).to eq(board_print)
    end
  end

  describe '#add_turn' do
    it 'place a piece in column E' do
      board = Board.new
      board.add_turn('X','E')
      board_print =
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|         X           |\n" +
        "  A B C D E F G H I J  \n"
      expect(board.print).to eq(board_print)
    end

    it 'place a piece in column A' do
      board = Board.new
      board.add_turn('X','E')
      board.add_turn('O', 'A')
      board_print =
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "| O       X           |\n" +
        "  A B C D E F G H I J  \n"

      expect(board.print).to eq(board_print)
    end

    it 'place a piece in column E again' do
      board = Board.new
      board.add_turn('X','E')
      board.add_turn('O','H')
      board.add_turn('X','E')
      board_print =
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|                     |\n" +
        "|         X           |\n" +
        "|         X     O     |\n" +
        "  A B C D E F G H I J  \n"
      expect(board.print).to eq(board_print)
    end
  end

  describe '#empty_space?' do
    it 'has empty space when starting a game' do
      board = Board.new
      expect(board.empty_space?).to eq(true)
    end

    it 'has no space when fully occupied' do
      board = Board.new
      10.times do
        ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"].each do |col|
          board.add_turn('X',col)
        end
      end
      expect(board.empty_space?).to eq(false)
    end
  end

  describe '#empty_space_in_vertical?' do
    it 'has empty space when starting a game' do
      board = Board.new
      expect(board.empty_space_in_vertical?('C')).to eq(true)
    end

    it 'has no space when fully occupied in one column' do
      board = Board.new
      10.times do
        board.add_turn('X','C')
      end
      expect(board.empty_space_in_vertical?('C')).to eq(false)
    end
  end
end

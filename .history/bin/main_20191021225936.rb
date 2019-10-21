#!/usr/bin/env ruby
# frozen_string_literal: true

class Board
# Class  Board for 2 Players [Tic_Tac_Toe]
  @player1
  @player2

  @blocks = [0,0,0,0,0,0,0,0,0]

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end
# Method collecting the names of the player
  def getPlayerNames
    puts "Insert player1's name"
    name = gets.chomp
    @player1.setName(name)
    puts "Welcome #{@player1.getName}"

    puts "Insert player2's name"
    name = gets.chomp
    @player2.setName(name)
    puts "Welcome #{@player2.getName}" # .getName enables output to have the name of the player
  end
# Printing of players names
  def printName
    puts @player1.getName
    puts @player2.getName
  end
# Displays positions of the board that have been taken
  def draw
    mv = @player1.getMove # Marks X for position occupied by player1
    printf(" %s | %s | %s \n", mv[0], mv[1], mv[2])
    puts '-----------'
    printf(" %s | %s | %s \n", mv[3], mv[4], mv[5])
    puts '-----------'
    printf(" %s | %s | %s \n", mv[6], mv[7], mv[8])

    puts "========================="

    mv = @player2.getMove # Marks O for position occupied by player2
    printf(" %s | %s | %s \n", mv[0], mv[1], mv[2])
    puts '-----------'
    printf(" %s | %s | %s \n", mv[3], mv[4], mv[5])
    puts '-----------'
    printf(" %s | %s | %s \n", mv[6], mv[7], mv[8])
  end
end

class Player
  @name
  @move
  @symbol

  def initialize(symbol)
    @move = [" ", " ", " ", " ", " ", " ", " ", " ", " "] # Positions on the board 
    @symbol = symbol
  end
# Displays the numbers on the bpard and one can chose from
  def setMove
    puts "Select a number 1 to 9 to set a position"
    puts ' 1 | 2 | 3 '
    puts '-----------'
    puts ' 4 | 5 | 6 '
    puts '-----------'
    puts ' 7 | 8 | 9 '

    move = gets.to_i - 1
    @move[move] = @symbol

    puts @move.to_s

  end

  # Marks the position of the user input
  def getMove
    @move
  end

  def setName(name)
    @name = name
  end

  def getName
    @name
  end
end

mplayer1 = Player.new("X")
mplayer2 = Player.new("O")
myBoard = Board.new(mplayer1, mplayer2)
myBoard.getPlayerNames
mplayer1.setMove
# myBoard.draw [Avoida Repeatition]
mplayer2.setMove
myBoard.draw #prints both boards 
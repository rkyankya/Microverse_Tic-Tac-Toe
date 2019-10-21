#!/usr/bin/env ruby
# frozen_string_literal: true

class Board

  @player1
  @player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def getPlayerNames
    puts "Insert player1's name"
    name = gets.chomp
    @player1.setName(name)
    puts "Welcome #{@player1.getName}"

    puts "Insert player2's name"
    name = gets.chomp
    @player2.setName(name)
    puts "Welcome #{@player2.getName}"
  end

  def printName
    puts @player1.getName
    puts @player2.getName
  end

  def draw
    mv = @player1.getMove
    printf(' %d | %d | %d \n', mv[1], mv[2], mv[3])
    puts '-----------'
    puts ' %d | %d | %d '
    puts '-----------'
    puts ' %d | %d | %d '
  end
end

class Player
  @name
  @move

  def initialize
    @move = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def setMove
    puts "Select a number 1 to 9 to set a position"
    puts ' 1 | 2 | 3 '
    puts '-----------'
    puts ' 4 | 5 | 6 '
    puts '-----------'
    puts ' 7 | 8 | 9 '

    move = gets.to_i - 1
    @move[move] = 1

    puts @move.to_s

  end

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

mplayer1 = Player.new
mplayer1.setMove
mplayer2 = Player.new
myBoard = Board.new(mplayer1, mplayer2)
myBoard.draw


myBoard.getPlayerNames


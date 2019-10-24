#!/usr/bin/env ruby
# frozen_string_literal: true

require 'io/console'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

mplayer1 = Player.new('X')
mplayer2 = Player.new('O')
my_board = Board.new(mplayer1, mplayer2)

play_again = true

# collecting names of the players
[mplayer1, mplayer2].each_with_index do |ply, index|
  system 'clear'
  puts 'Insert player' + (index + 1).to_s + "'s name"
  name = gets.chomp
  ply.name = name
end

# Displays positions of the board that have been taken
def draw(blocks)
  system 'clear'
  mv = blocks # Marks X for position occupied by player1
  printf(" 1 | 2 | 3        %s | %s | %s \n", mv[0], mv[1], mv[2])
  puts '-----------      -----------'
  printf(" 4 | 5 | 6   =>   %s | %s | %s \n", mv[3], mv[4], mv[5])
  puts '-----------      -----------'
  printf(" 7 | 8 | 9        %s | %s | %s \n", mv[6], mv[7], mv[8])

  puts '============================'
end

def key_tocontinue(msg)
  system 'clear'
  puts msg + "\npress a key to continue..."
  STDIN.getch
end

while play_again

  my_board.reset
  draw(my_board.blocks)

  while my_board.has_movs
    puts "#{my_board.player_turn.name} please pick a number to set your \"#{my_board.player_turn.symbol}\" mark: \n"
    move = gets.to_i - 1
    system 'clear'

    key_tocontinue('that mark can\'t be done, because the block is not empty, try again...') unless my_board.mark(move)

    draw(my_board.blocks)
  end

  if my_board.winner
    puts "#{my_board.winner.name} WINS!!"
  else
    puts 'This is a draw'
  end

  loop do
    puts 'Would you like to play again ? y/n '
    rp = gets.chomp

    if %w[y n].include?(rp)
      play_again = rp == 'y'
      break
    end
  end

  puts 'BYE'
end

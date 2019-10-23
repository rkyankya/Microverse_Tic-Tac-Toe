#!/usr/bin/env ruby
# frozen_string_literal: true

require 'io/console'
require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

mplayer1 = Player.new('X')
mplayer2 = Player.new('O')
my_board = Board.new(mplayer1, mplayer2)

# collecting names of the players
[mplayer1, mplayer2].each_with_index do |ply, index|
  system 'clear'
  puts 'Insert player' + (index + 1).to_s + "'s name"
  name = gets.chomp
  ply.name = name
end

my_board.draw

while my_board.has_movs
  puts "#{my_board.player_turn.name} please pick a number to set your \"#{my_board.player_turn.symbol}\" mark: \n"
  move = gets.to_i - 1
  system 'clear'

  my_board.mark(move)
  my_board.draw
end

if my_board.winner
  puts "#{my_board.winner.name} WINS!!"
else
  puts 'This is a draw'
end

#!/usr/bin/env ruby
# frozen_string_literal: true

require 'io/console'
require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

mplayer1 = Player.new('X')
mplayer2 = Player.new('O')
my_board = Board.new(mplayer1, mplayer2)

my_game = Game.new(my_board)
my_game.start

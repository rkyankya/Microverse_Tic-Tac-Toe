# frozen_string_literal: true

require 'io/console'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

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

describe 'board' do
  mplayer1 = Player.new('X')
  mplayer2 = Player.new('O')
  my_board = Board.new(mplayer1, mplayer2)

  it 'test 1' do
    my_board.reset

    my_board.mark(0)
    my_board.mark(2)
    my_board.mark(3)
    my_board.mark(4)
    my_board.mark(6)

    expect(my_board.winner).to be mplayer1
  end

  it 'test 1' do
    my_board.reset

    my_board.mark(8)
    my_board.mark(0)
    my_board.mark(3)
    my_board.mark(1)
    my_board.mark(4)
    my_board.mark(2)

    expect(my_board.winner).to be mplayer2
  end
end

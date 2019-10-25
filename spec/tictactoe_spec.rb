# frozen_string_literal: true

require 'io/console'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

mplayer1 = Player.new('X')
mplayer2 = Player.new('O')
my_board = Board.new(mplayer1, mplayer2)

describe 'board' do
  it 'test 1' do
    my_board.mark(0)
    my_board.mark(2)
    my_board.mark(3)
    my_board.mark(4)
    my_board.mark(6)

    expect(my_board.winner).to be mplayer1
  end
end

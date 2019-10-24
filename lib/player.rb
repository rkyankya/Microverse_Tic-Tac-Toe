# frozen_string_literal: true

class Player
  attr_accessor :name
  attr_accessor :move
  attr_reader :symbol

  def initialize(symbol)
    @move = Array.new(9, ' ') # Positions on the board
    @symbol = symbol
  end

  # Marks the position of the user input
  def mark_symbol(pos)
    @move[pos] = @symbol
  end
end

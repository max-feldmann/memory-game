require_relative 'card'

# Suppposed to handle the Logic for the Board in a game of Memory

class Board

    VALUES = ("A".."Z").to_a
    
    def initialize
        @board_size = 4
        @grid = Array.new(@board_size) {Array.new(@board_size)}
    end

end

b = Board.new

p b

b[0][2] = :X
require_relative 'card'

# Suppposed to handle the Logic for the Board in a game of Memory

class Board

    VALUES = ("A".."Z").to_a
    
    def initialize
        @board_size = 4
        @grid = Array.new(@board_size) {Array.new(@board_size)}
    end

    attr_reader :grid

    # -- UTILITY METHODS --
    
    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
      row, col = pos
      @grid[row][col] = value
    end
    

    def populate!
        number_of_pairs = ( @board_size * @board_size ) / 2
        chosen_values = (VALUES[0...number_of_pairs] * 2).shuffle

        @grid.each_with_index do |row, y|
            row.each_with_index do |col, x|
                self[[y, x]] = Card.new(chosen_values.pop)
            end
        end
    end


end

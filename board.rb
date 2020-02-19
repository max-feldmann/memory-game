require_relative 'card'

# Suppposed to handle the Logic for the Board in a game of Memory

class Board

    VALUES = ("A".."Z").to_a
    
    def initialize
        @board_size = 4
        @grid = Array.new(@board_size) {Array.new(@board_size)}
        populate_board!
    end

    attr_reader :grid, :board_size

    # -- MAIN LOGIC METHODS FOR BOARD --

    def populate_board!
        number_of_pairs = ( @board_size * @board_size ) / 2
        chosen_values = (VALUES[0...number_of_pairs] * 2).shuffle

        @grid.each_with_index do |row, y|
            row.each_with_index do |col, x|
                self[[y, x]] = Card.new(chosen_values.pop)
            end
        end
    end

    def print_board
        system ("clear")
        puts '  0 1 2 3 4 5 6 7 8 9 '[0..(self.board_size * 2)]

        @grid.each_with_index do |row, i|
                puts "#{i} #{row.join" "}"
        end
    end

    def reveal(pos)
        if revealed?(pos)
            puts "You can´t flip a card thats already revealed ;)"
        else
            self[pos].reveal
        end
        self[pos].value
    end

    def won?
        @grid.all? do |row|
            row.all? {|card| card.revealed?}
        end
    end



    # -- UTILITY METHODS --

    def revealed?(guessed_position)
        self[[guessed_position]].revealed?
    end
    
    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
      row, col = pos
      @grid[row][col] = value
    end

end

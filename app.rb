class Square
    attr_accessor :position, :row, :symbol

    @@square_counter = 1
    def initialize
        @position = @@square_counter
        @@square_counter += 1
        @symbol = "#{row}#{position}".to_sym
        if @position.between?(1, 3)
            @row = :a
        elsif @position.between?(4, 6)
            @row = :b
        else
            @row = :c
        end
    end

    def update(player_symbol)
        @symbol = player_symbol.to_sym
    end
end

class Game
    def initialize
        @board = Array(9, Square.new)
    end

    def show_board
        print "#{@board[(0..2)]}\n"
        print "#{@board[(3..5)]}\n"
        print "#{@board[(6..8)]}\n"
    end

    def get_player_square
        puts "Select a cell>>"
        gets.chomp.to_sym
    end
end
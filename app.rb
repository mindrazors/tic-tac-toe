class Game
    def initialize
        @board = Array.new(9)
        @board.map! do |square|
            square = Square.new.symbol
        end
    end

    def show_board
        print "#{@board[(0..2)]}\n"
        print "#{@board[(3..5)]}\n"
        print "#{@board[(6..8)]}\n"
    end
end

class Square
    attr_accessor :position, :row, :symbol

    @@square_counter = 1
    def initialize
        @symbol = :%
        @position = @@square_counter
        case @position
        when 1
            @row = :a
            @column = :left
            @diagonal = :a1_c3
        when 2
            @row = :a
            @column = :middle
        when 3
            @row = :a
            @column = :right
            @diagonal = :a3_c1
        when 4
            @row = :b
            @column = :left
        when 5
            @row = :b
            @column = :middle
            @diagonal = :both
        when 6
            @row = :b
            @column = :right
        when 7
            @row = :c
            @column = :left
            @diagonal = :a3_c1
        when 8
            @row = :c
            @column = :middle
        when 9
            @row = :c
            @column = :right
            @diagonal = :a1_c3
        end
        @@square_counter += 1
    end

    def update(player_symbol)
        @symbol = player_symbol.to_sym
    end
end

def get_player_input
    puts "Select a square by combining the row (a-c) with a number (e.g. c1 or a3)"

game = Game.new
game.show_board
class Game
    def initialize
        @@player_one = Players.new
        @@player_two = Players.new
        @@players = [@@player_one, @@player_two]
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

    def get_player_input
        puts "Select a square by combining the row (a-c) with a number (e.g. c1 or a3)"
        gets.chomp.to_sym
    end

    def update_board(selected_alphanumeric)
        square_index = @board.find_index {|square| square.alphanumeric == selected_alphanumeric}
        @board[square_index].symbol = @current_player.symbol
    end

    def play
        @current_player = @@players[0]
        show_board
        update_board(get_player_input)
        @current_player = @@players[1]
    end
end

class Square
    attr_accessor :index, :row, :symbol, :alphanumeric

    @@square_counter = 1
    def initialize
        @symbol = :%
        @index = @@square_counter
        case @index
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
        if @column == :left
            @alphanumeric = "#{row}1".to_sym
        elsif @column == :middle
            @alphanumeric = "#{row}2".to_sym
        else
            @alphanumeric = "#{row}3".to_sym
        end
        @@square_counter += 1
    end

    def update(player_symbol)
        @symbol = player_symbol.to_sym
    end
end

class Players
    attr_accessor :name, :symbol

    @@player_count = 0
    def initialize
        @@player_count += 1
        puts "Enter your name, player #{@@player_count}"
        @name = gets.chomp.downcase.capitalize
        @symbol = @@player_count < 1 ? :X : :O
        puts "#{@name} will have the #{@symbol.to_s}'s"
    end
end

game = Game.new
game.play
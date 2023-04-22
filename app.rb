class Game
    attr_accessor :players

    @@played_before = nil

    def initialize
        unless @@played_before == true
            @@player_one = Players.new
            @@player_two = Players.new
            @@players = [@@player_one, @@player_two]
        end
        @current_player = nil

        Square.square_counter = 1
        
        @board = Array.new(9)
        @board.map! do |square|
            square = Square.new
        end
        @game_over = false
        @winner = nil
    end


    def show_board
        @board.each do |square|
            unless (square.index) % 3 == 0
                print "#{square.symbol.to_s} "
            else
                print "#{square.symbol.to_s}\n"
            end
        end
    end

    def get_player_input
        puts "Select a square by combining the row (a-c) with a number (e.g. c1 or a3)"
        gets.chomp.to_sym
    end

    def check_rows
        if @current_player.owned_squares.count {|square| square.row == :a} == 3
            @game_over = true
        elsif @current_player.owned_squares.count {|square| square.row == :b} == 3
            @game_over = true
        elsif @current_player.owned_squares.count {|square| square.row == :c} == 3
            @game_over = true
        end
    end

    def check_columns
        if @current_player.owned_squares.count {|square| square.column == :left} == 3
            @game_over = true
        elsif @current_player.owned_squares.count {|square| square.column == :middle} == 3
            @game_over = true
        elsif @current_player.owned_squares.count {|square| square.column == :right} == 3
            @game_over = true
        end
    end

    def check_diagonals
        if @current_player.owned_squares.count {|square| square.diagonal == :a1_c3} == 2
            if @current_player.owned_squares.count {|square| square.diagonal == :both} == 1
                @game_over = true
            end
        elsif @current_player.owned_squares.count {|square| square.diagonal == :a3_c1} == 2
            if @current_player.owned_squares.count {|square| square.diagonal == :both} == 1
                @game_over = true
            end
        end
    end

    def check_for_victory
        check_rows
        check_columns
        check_diagonals
    end

    def update_board(alphanumeric)
        selected_square = @board.find {|square| square.alphanumeric == alphanumeric}
        selected_square.update(@current_player.symbol)
        @current_player.owned_squares.push(selected_square)
    end

    def switch_current_player
        @current_player = @current_player == @@player_one ? @@player_two : @@player_one
    end

    def play
        @current_player = @@player_one
        until @game_over
            show_board
            update_board(get_player_input)
            check_for_victory
            switch_current_player
        end
        puts "Game over!"
        @@played_before = true
        @@player_one.owned_squares = []
        @@player_two.owned_squares = []
        Game.new.play
    end
end

class Square
    attr_accessor :index, :row, :column, :diagonal, :symbol, :alphanumeric

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

    def self.square_counter=(value)
        @@square_counter = value
    end
end

class Players
    attr_accessor :name, :symbol, :owned_squares, :current_player

    @@player_count = 0
    def initialize
        @@player_count += 1
        puts "Enter your name, player #{@@player_count}"
        @name = gets.chomp.downcase.capitalize
        @symbol = @@player_count <= 1 ? :X : :O
        puts "#{@name} will have the #{@symbol.to_s}'s"
        @owned_squares = []
    end

    def get_square(square_position)
        @owned_squares.push(square_position)
    end

    def self.get_current_player
        @@current_player
    end

end
game = Game.new
game.play
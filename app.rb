# Build a tic-tac-toe game on the command line where two human players can play against each other
# and the board is displayed in between turns.

# What should be a class?
    # i.e. what objects should be similarly structured?
        # the squares of the grid
    # i.e. what objects will be interacted with in the same way?
        # the squares of the grid
    # i.e. what objects will be using the same methods?
        # rows, columns, and diagonals
# What should be an instance variable/method?
    # i.e. what data should be shared between instances of similar objects?
# What should the user be seeing?
    # the board outline
    # the X's and O's on the board
    # an input prompt
# What will using the program look like?
    # user will see empty tic-tac-toe outline in console, created using line characters
    # user will be prompted to choose which square to put either an x or an o
    # user will continue to provide input until the game results in a draw, loss, or win
    # user will see message declaring the winner
    # tic-tac-toe grid can be reset to start a new game

def message_user(message)
    puts message
end
def get_input
    gets.chomp
end

message_user(get_input())

def draw_grid(grid_layout)
    puts grid_layout[0...3]
    puts grid_layout[3...6]
    puts grid_layout[6...9]
end

class Square
    attr_accessor :position, :mark
    def initialize(position, mark)
        @position = position
        @mark = mark
    end
    def position=(new_position)
        @position = new_position
    end
end

class GridInterpreter
    def initialize(row_a =[], row_b =[], row_c =[])
        @@row_a = row_a
        @@row_b = row_b
        @@row_c = row_c
    end
end

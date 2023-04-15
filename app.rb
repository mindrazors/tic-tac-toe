# Build a tic-tac-toe game on the command line where two human players can play against each other
# and the board is displayed in between turns.

# What should be a class?
    # i.e. what objects should be similarly structured?
        # the squares of the grid
    # i.e. what objects will be interacted with in the same way?
        # the squares of the grid
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

class Square
    def initialize(position)
        @position = position
        @mark = nil
    end
    def change_state(mark)
        @mark = mark
    end
end

a1 = Square.new(:a1)


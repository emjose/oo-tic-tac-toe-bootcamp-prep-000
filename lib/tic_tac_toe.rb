class TicTacToe
    
    def initialize
      @board = [" ", " ", " ", " ", " ", " ", " ", " ", " " ]
    end
    
    WIN_COMBINATIONS = [ 
        [0,1,2],[3,4,5],[6,7,8],
        [0,3,6],[1,4,7],[2,5,8],
        [0,4,8],[6,4,2]
    ]

    
    
    def display_board 
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input) 
        user_input.to_i - 1
    end

    def move(index, current_player) 
        @board[index] = current_player
    end

    def position_taken?(index) 
        @board[index] != " "
    end
    
    def valid_move?(index)
        !position_taken?(index) && index.between?(0, 8) # why? no board
    end

    def turn_count
        @board.count {|value| value == "X" || value == "O" }
    end

    def current_player
        turn_count(@board).even? ? "X" : "O"
    end
    
    def turn 
        puts "Please enter 1-9:" 
        input = gets.strip 
        index = input_to_index(input) 
        if valid_move?(@board, index) 
            move(@board, index,current_player(@board)) 
            display_board(@board)
        else
            turn(@board) 
        end
    end
    
    def won? 
        WIN_COMBINATIONS.detect do |e|
            @board[e[0]] == @board[e[1]] && 
            @board[e[1]] == @board [e[2]] &&
            position_taken?(@board, e[0])
        end
    end
    
    def full?
        @board.all? { |e| e == "X" || e == "O"}
    end 
    
    def draw?
        !won?(@board) && full?(@board) 
    end
    
    def over?
        won?(@board) || draw?(@board)
    end
    
    def winner
        if winning_board = won?(@board)
            board[winning_board[0]]
        end    
    end 
    
    def play
        until over?(@board) 
            turn(@board) 
        end
        if won?
            puts "Congratulations #{winner(@board)}!"
        elsif draw?(@board)
            puts "Cat's Game!"
        end
    end
end
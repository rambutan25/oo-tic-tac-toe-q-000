class TicTacToe
  def initialize(board=nil)
    @board = board || Array.new(9, " ")

  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def move(position, token="X")

    @board[position.to_i-1] = token
  end

  def position_taken?(position)
     @board[position.to_i] == "X" || @board[position.to_i] == "O"
  end

  def valid_move?(position)
     @board[position.to_i-1] == " " && position.to_i.between?(1,9)
  end

  def turn
  puts "Please enter position 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      else
      turn
    end
    display_board
  end

#asks for input again


  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |position|
      if @board[position[0]] == "X" && @board[position[1]] == "X" && @board[position[2]] == "X"
        true
        elsif @board[position[0]] == "O" && @board[position[1]] == "O" && @board[position[2]] == "O"
        true
        else
        false
      end
    end
  end

  def full?
    @board.count("X")  +  @board.count("O") == 9 ?
    true : false
  end



  def draw?
    !won?
  end

  def over?
    full?
  end
# draw , full and won are not the same but combine is in full?

  def winner
    if token_win = won?
     @board[token_win.first]
      else
      nil
    end
  end

  def play
    until over?
    turn
    end



  end
end

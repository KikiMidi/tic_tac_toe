class TicTacToe

  def initialize()
    @turn = 1
    @board = {
      0=>{0=>nil,1=>nil,2=>nil},
      1=>{0=>nil,1=>nil,2=>nil},
      2=>{0=>nil,1=>nil,2=>nil}
    }
  end

  def start_game
    until winner? | stale_mate?
      token = @turn.odd? ? :x : :o
      puts "\nPlayer #{token}, what is your move(row,col)?\n"
      input = gets.chomp.split(',')

      if input.length == 1 #if input is quit
        quit = (input[0].downcase == 'q')
        if quit
          break
        else
          puts "Please enter x,y coordinates to move or Q to quit!"
        end
      elsif input.length == 2 #if input is a move
        row = input[0].to_i
        col = input[1].to_i

        if move(row, col, token)
          show_board
          @turn = @turn + 1
        end
      end
    end

    if quit
      puts "Bye!"
      return
    elsif winner?
      puts "Player #{token} is the winner!"
    else
      puts "Meow!"
    end
  end

  def show_board
    puts <<-OUTPUT
     #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}
    -----------
     #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}
    -----------
     #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]}
    OUTPUT
  end

  def winner?
    #Try to make the below apply to both :x and :o
    [:x,:o].any? do |token|
      select_row1 = @board[0].select {|k,v| v == token }
      select_row2 = @board[1].select {|k,v| v == token }
      select_row3 = @board[2].select {|k,v| v == token }

      select_column1 = @board[0][0] == token &&
                       @board[1][0] == token &&
                       @board[2][0] == token

      select_column2 = @board[0][1] == token &&
                       @board[1][1] == token &&
                       @board[2][1] == token

      select_column3 = @board[0][2] == token &&
                       @board[1][2] == token &&
                       @board[2][2] == token

      select_diagonal1 = @board[0][0] == token &&
                         @board[1][1] == token &&
                         @board[2][2] == token

      select_diagonal2 = @board[2][0] == token &&
                         @board[1][1] == token &&
                         @board[0][2] == token

        (select_row1.size == 3) ||
        (select_row2.size == 3) ||
        (select_row3.size == 3) ||

        select_column1 ||
        select_column2 ||
        select_column3 ||

        select_diagonal1 ||
        select_diagonal2
    end

  end

  def stale_mate?
    [0,1,2].map do |x|
      [0,1,2].map do |y|
        space_blank?(x,y)
      end
    end.flatten.none?
  end

  def move(x, y, token)
    if !token_on_board?(x, y)
      puts "This space is not on the board! Please make a different move."
      return false
    end

    if space_blank?(x, y)
      @board[x][y] = token
    else
      puts "This space is taken! Please make a different move."
      return false
    end

    true
  end

  def token_on_board?(x, y)
    @board.has_key?(x) &&
    @board[x].has_key?(y)
  end

  def space_blank?(x, y)
   @board[x][y] == nil
  end

end


# game = TicTacToe.new
# game.start_game

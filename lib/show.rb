class Show

  def show_board(board)
    #TO DO : affiche sur le terminal l'objet de classe Board en entrée. S'active avec un Show.new.show_board(instance_de_Board)
    hline = "\u2502" # |
    vline = "\u2500" # -
    cross = "\u253C" # +
    midlle = vline + cross + vline + cross + vline
    i = 0
    while i < 9
      if board.array_boardcase[i].case_value == " "
        print board.array_boardcase[i].case_id
      else
        print board.array_boardcase[i].case_value
      end
      if (i != 2 && i != 5 && i != 8)
        print hline
      end
      if (i == 2 || i == 5)
        puts ""
        puts midlle
      end
      i = i + 1
    end
    puts ""
    puts "-" * 30
    puts ""
  end

end

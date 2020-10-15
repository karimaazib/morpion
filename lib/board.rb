class Board
  #TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué
  attr_accessor :array_boardcase, :count_turn

  def initialize
    #TO DO :
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
    @array_boardcase = Array.new
    @array_boardcase[0] = BoardCase.new("1")
    @array_boardcase[1] = BoardCase.new("2")
    @array_boardcase[2] = BoardCase.new("3")
    @array_boardcase[3] = BoardCase.new("4")
    @array_boardcase[4] = BoardCase.new("5")
    @array_boardcase[5] = BoardCase.new("6")
    @array_boardcase[6] = BoardCase.new("7")
    @array_boardcase[7] = BoardCase.new("8")
    @array_boardcase[8] = BoardCase.new("9")
    @count_turn = 0
  end

  def play_turn(player)
    #TO DO : une méthode qui :
    #1) demande au bon joueur ce qu'il souhaite faire
    mouv = ""
    # Tant que le joueur ne choisi pas une valeur entre 1 et 9 ou une case vide, on lui demande de choisir une nouvelle position
    while (mouv != "1" && mouv != "2" && mouv != "3" && mouv != "4" && mouv != "5" && mouv != "6" && mouv != "7" && mouv != "8" && mouv != "9") || (mouv != "" && self.array_boardcase[mouv.to_i - 1].case_value != " ")
      puts "#{player.player_name}, Quel est ton mouv ?"
      print "> "
      mouv = gets.chomp
      if (mouv != "1" && mouv != "2" && mouv != "3" && mouv != "4" && mouv != "5" && mouv != "6" && mouv != "7" && mouv != "8" && mouv != "9") || (mouv != "" && self.array_boardcase[mouv.to_i - 1].case_value != " ")
        puts "Merci de saisir un chiffre entre 1 et 9 ou de sélectionner une case vide!"
        mouv = ""
      end
    end

    #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
     self.array_boardcase[mouv.to_i - 1].case_value = player.player_value
     self.count_turn = self.count_turn + 1
  end

  def victory
    #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
    i = 0
    while i < 3 #premiere boucle permettant de checker les colonnes
      if self.array_boardcase[i].case_value == self.array_boardcase[i + 3].case_value && self.array_boardcase[i].case_value == self.array_boardcase[i + 6].case_value && self.array_boardcase[i].case_value != " "
        return true
      end
      i = i + 1
    end
    i = 0 #je reinitialise pour pouvoir tester les lignes
    while i < 7 #seconde boucle permettant de checker les lignes
      if self.array_boardcase[i].case_value == self.array_boardcase[i + 1].case_value && self.array_boardcase[i].case_value == self.array_boardcase[i + 2].case_value && self.array_boardcase[i].case_value != " "
        return true
      end
      i = i + 3
    end
    #je teste la premiere diagonale
    if self.array_boardcase[0].case_value == self.array_boardcase[4].case_value && self.array_boardcase[0].case_value == self.array_boardcase[8].case_value && self.array_boardcase[0].case_value != " "
      return true
    end
    #je teste la seconde diagonale
    if self.array_boardcase[2].case_value == self.array_boardcase[4].case_value && self.array_boardcase[2].case_value == self.array_boardcase[6].case_value && self.array_boardcase[2].case_value != " "
      return true
    end
    return false
  end
end

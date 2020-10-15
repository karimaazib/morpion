class Game
  #TO DO : la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.
  attr_accessor :current_player, :status, :board, :other_player

  def initialize(player1_name = "", player2_name = "")
    #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
    if player1_name == "" && player2_name == ""
      puts "Quel est le nom du premier joueur:"
      print "> "
      player1_name = gets.chomp
      puts "Quel est le nom du second joueur:"
      print "> "
      player2_name = gets.chomp
    end
    player1 = Player.new(player1_name, "X")
    player2 = Player.new(player2_name, "O")
    @current_player = player1
    @other_player = player2
    @status = "ongoing"
    @board = Board.new
  end

  def turn
    #TO DO : méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
    Show.new.show_board(board) #Affiche le plateau
    board.play_turn(current_player) #Le joueur actuel joue
    if (board.victory == true) #Verifie si son mouv est gagnant
      self.status = "winner"
    end
    if (board.victory == false && board.count_turn == 9) #Verifie si le plateau est rempli mais qu'il n'y a aucun gagnant et donc s'il y a egalite
      self.status = "ex-aequo"
    end
    #je switch les joueurs pour qu'au prochain tour ce soit l'autre qui joue (tmp est ma variable tampon ou je stock l'information pour ne pas la perdre quand je change la valeur de current_player)
    tmp = self.current_player
    self.current_player = self.other_player
    self.other_player = tmp
  end

  def new_round(player1_name, player2_name)
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
    Game.new(player1_name, player2_name)
  end

  def game_end
    # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
    Show.new.show_board(board)
    if (self.status == "winner")
      puts "Le gagnant est #{self.other_player.player_name} ! Félicitation."
    end
    if (self.status == "ex-aequo")
      puts "Sorry les gars, vous êtes ex-aequo !"
    end
    puts ""
  end

end

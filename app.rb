require_relative 'lib/boardcase'
require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/show'

class Application

  def perform
    # TO DO : méthode qui initialise le jeu puis contient des boucles while pour faire tourner le jeu tant que la partie n'est pas terminée.
    game = Game.new #On initialise la partie : les noms de joueurs, un board vierge avec les positions, status de la partie
    end_game = ""
    puts "Que la partie commence !"
    puts ""
    while (end_game != "exit")
      while game.status == "ongoing"
        game.turn #On lance le jeu et on continue tant que personne ne gagne ou que le plateau n'est pas rempli
        puts ""
      end
      game.game_end
      game = Game.new(game.current_player.player_name, game.other_player.player_name)
      puts "Si vous souhaitez faire une nouvelle partie, faites 'enter'"
      puts "Si vous souhaitez arrêter, saississez 'exit'"
      print "> "
      end_game = gets.chomp
      puts ""
      if (end_game != "exit")
        puts "#{game.current_player.player_name} cette fois-ci montre nous tes talents !"
        puts ""
      end
    end
  end

end


Application.new.perform

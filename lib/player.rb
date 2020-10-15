class Player
  #TO DO : la classe a 2 attr_reader, son nom et sa valeur (X ou O).
  attr_reader :player_name, :player_value


  def initialize(name, value)
      @player_name = name
      @player_value = value
  end
end

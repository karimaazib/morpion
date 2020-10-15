class BoardCase
  #TO DO : la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case
  attr_accessor :case_id, :case_value


  def initialize(name_case)
    @case_id = name_case
    @case_value = " "
  end

end

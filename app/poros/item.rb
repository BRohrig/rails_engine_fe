class Item
  attr_reader :name

  def initialize(response)
    @name = response[:attributes][:name]
  end
  


end
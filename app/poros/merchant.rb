class Merchant
  attr_reader :name,
              :id

  def initialize(response)
    
    @name = response[:attributes][:name]
    @id = response[:id]
  end

end
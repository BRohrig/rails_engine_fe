class Item
  attr_reader :name,
              :id,
              :description,
              :unit_price,
              :merchant_id

  def initialize(response)
    @name = response[:attributes][:name]
    @id = response[:id]
    @description = response[:attributes][:description]
    @unit_price = response[:attributes][:unit_price]
    @merchant_id = response[:attributes][:merchant_id]
  end
  


end
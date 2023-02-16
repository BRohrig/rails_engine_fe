class ItemsFacade
  def self.get_items
    ItemService.get_items[:data].map do |item_data|
      Item.new(item_data)
    end
  end 

  def self.find_item(id)
    Item.new(ItemService.find_item(id)[:data])
  end
end
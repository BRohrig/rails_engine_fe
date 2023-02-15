class MerchantsFacade
  def self.get_merchants
    MerchantService.get_merchants[:data].map do |merchant_data|
      Merchant.new(merchant_data)
    end
  end

  def self.find_merchant(id)
    Merchant.new(MerchantService.find_merchant(id)[:data])
  end

  def self.find_items(merchant_id)
    MerchantService.find_merchant_items(merchant_id)[:data].map do |item_data|
      Item.new(item_data)
    end
  end

end
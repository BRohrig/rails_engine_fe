class MerchantsFacade
  def self.get_merchants
    MerchantService.get_merchants[:data].map do |merchant_data|
      Merchant.new(merchant_data)
    end
  end

  def self.find_merchant(id)

  end

end
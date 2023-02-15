class MerchantService
  def self.get_merchants
    JSON.parse(conn.get("/api/v1/merchants").body, symbolize_names: true)
  end

  def self.find_merchant(id)
    JSON.parse(conn.get("/api/v1/merchants/#{id}").body, symbolize_names: true)
  end

  def self.find_merchant_items(merchant_id)
    JSON.parse(conn.get("/api/v1/merchants/#{merchant_id}/items").body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: "http://localhost:3000")
  end
end
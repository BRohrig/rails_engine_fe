class ItemService
  def self.get_items
    JSON.parse(conn.get.body, symbolize_names: true)
  end

  def self.find_item(id)
    JSON.parse(conn.get("/api/v1/items/#{id}").body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: "http://localhost:3000/api/v1/items")
  end

end
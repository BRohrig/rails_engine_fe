require 'rails_helper'

RSpec.describe "merchant show page" do
  before :each do
    json_response = File.read('spec/fixtures/merchant_four_response.json')
    stub_request(:get, "http://localhost:3000/api/v1/merchants/4")
      .to_return(status: 200, body: json_response)
    response_two = File.read('spec/fixtures/merchant_four_items_response.json')
    stub_request(:get, "http://localhost:3000/api/v1/merchants/4/items")
      .to_return(status: 200, body: response_two)
    visit merchant_path(4)
  end

  it 'displays the merchant name and all their items' do
    expect(page).to have_content("Cummings-Thiel")
    within "#merchant_items" do
      expect(page).to have_content("Item In Sed")
      expect(page).to have_content("Item Blanditiis Eum")
      expect(page).to have_content("Item Ut Quo")
      expect(page).to have_content("Item Voluptate Quo")
    end
  end

end
require 'rails_helper'

RSpec.describe "items index page" do
  before :each do
    json_response = File.read('spec/fixtures/items_response.json')
    stub_request(:get, "http://localhost:3000/api/v1/items")
      .to_return(status: 200, body: json_response)
    json_response2 = File.read('spec/fixtures/item_ten_response.json')
    stub_request(:get, "http://localhost:3000/api/v1/items/10")
      .to_return(status: 200, body: json_response2)
    visit items_path
  end

  it 'has a title and lists all items' do
    expect(page).to have_content("Items")
    within "#item_list" do
      expect(page).to have_link("Item Nemo Facere")
      expect(page).to have_link("Item Rerum Magni")
      expect(page).to have_link("Item Itaque Consequatur")
      expect(page).to have_link("Item Voluptates Qui")
    end
  end

  it 'has a link that takes me to an item show page which lists that items details' do
    within "#item_list" do
      click_link("Item Quidem Suscipit")
      expect(current_path).to eq(item_path(10))
      expect(page).to have_content("Description: Reiciendis sed aperiam culpa animi laudantium. Eligendi veritatis sint dolorem asperiores. Earum alias illum eos non rerum.")
      expect(page).to have_content("Unit Price: $340.18")
      expect(page).to have_content("Merchant: Schroeder-Jerde")
    end

  end

end
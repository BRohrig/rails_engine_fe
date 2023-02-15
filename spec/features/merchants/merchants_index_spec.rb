require 'rails_helper'

RSpec.describe "merchants index page" do
  before :each do
    json_response = File.read('spec/fixtures/merchants_response.json')
    stub_request(:get, "http://localhost:3000/api/v1/merchants")
      .to_return(status: 200, body: json_response)
    visit merchants_path
  end

  it 'has a list of the merchants that exist on the API' do
    within "#merchants_list" do
      expect(page).to have_content("Schroeder-Jerde")
      expect(page).to have_content("Williamson Group")
      expect(page).to have_content("Osinski, Pollich and Koelpin")
      expect(page).to have_content("Bechtelar, Jones and Stokes")
      expect(page).to have_content("Glover Inc")
    end
  end

  it 'has links to take the user to the associated merchant show page' do
    within "#merchants_list" do
      expect(page).to have_link("Schroeder-Jerde")
      expect(page).to have_link("Williamson Group")
      expect(page).to have_link("Osinski, Pollich and Koelpin")
      expect(page).to have_link("Bechtelar, Jones and Stokes")
      expect(page).to have_link("Glover Inc")
      click_link("Schroeder-Jerde")
      expect(current_path).to eq(merchant_path(1))
    end
  end



end
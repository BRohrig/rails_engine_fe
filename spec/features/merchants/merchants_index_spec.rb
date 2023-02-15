require 'rails_helper'

RSpec.describe "merchants index page" do
  before :each do
    json_response = File.read('spec/fixtures/merchants_response.json')
    stub_request(:get, "http://localhost:3000/merchants")
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



end
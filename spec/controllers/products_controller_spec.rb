require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  let(:valid_attributes) {
    [
        {
            "title": "Passionfruit and Guava Bath Bomb, Bath Fizzy",
            "description": "Made with almond oil.",
            "country": "United States",
            "price": "4.59"
        },
        {
            "title": "Dragonfly silver necklace-choker",
            "description": "All silver with one dragonfly. Gems on wings.",
            "country": "Canada",
            "price": "8.60"
        }
    ]
  }

  it "index page to successfully render" do

    get :index, params: {}
    expect(response).to be_successful
  end
end
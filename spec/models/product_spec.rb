require 'rails_helper'

RSpec.describe Product, type: :model do

  #TODO Import JSON instead of specifying attributes here

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
            "description": "All silver with one dragonfly. Gems on wings Passion.",
            "country": "Canada",
            "price": "8.60"
        }
    ]
  }

  let(:title_params) { {"search"=>{"title"=>"Passionfruit",
                                   "country"=>"-1",
                                   "min_price"=>"",
                                   "max_price"=>"",
                                   "sort"=>"relevance"}} }

  let(:country_params) { {"search"=>{"title"=>"",
                                   "country"=>"United States",
                                   "min_price"=>"",
                                   "max_price"=>"",
                                   "sort"=>"relevance"}} }

  let(:price_params) { {"search"=>{"title"=>"",
                                     "country"=>"",
                                     "min_price"=>"5",
                                     "max_price"=>"10",
                                     "sort"=>"relevance"}} }

  before(:each) do
    products = Product.create! valid_attributes
  end

  it "return only one product" do
    @result = Product.filter(title_params)
    expect(@result.count).to eq(1)
  end

  it "do not return more then one product" do
    @result = Product.filter(title_params)
    expect(@result.count).not_to be > 1
  end

  it "find a searched product by name and sort by relevance" do
    @result = Product.filter(title_params)
    expect(@result.first.title).to eq("Passionfruit and Guava Bath Bomb, Bath Fizzy")
  end

  it "doesn't find a searched product by wrong name" do
    @result = Product.filter(title_params)
    expect(@result).not_to eq("Dragonfly silver necklace-choker")
  end

  it "contain only desired country" do
    @result = Product.filter(country_params)
    expect(@result.pluck(:country)).to eq(Product.where(country: 'United States').pluck(:country))
  end

  it "not contain undesired country" do
    @result = Product.filter(country_params)
    expect(@result.pluck(:country)).not_to eq(Product.where(country: 'Canada').pluck(:country))
  end

  it "get price greater then" do
    @result = Product.filter(price_params)
    prices = @result.pluck(:price)
    prices.each do |price|
      expect(price).to be > 5
    end
  end

  it "do not get price less then" do
    @result = Product.filter(price_params)
    prices = @result.pluck(:price)
    prices.each do |price|
      expect(price).not_to be < 5
    end
  end

end
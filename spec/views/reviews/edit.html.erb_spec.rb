require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :title => "MyString",
      :description => "MyString",
      :rating => 1.5,
      :sfthouse => nil
    ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do

      assert_select "input[name=?]", "review[title]"

      assert_select "input[name=?]", "review[description]"

      assert_select "input[name=?]", "review[rating]"

      assert_select "input[name=?]", "review[sfthouse_id]"
    end
  end
end

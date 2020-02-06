require 'rails_helper'

RSpec.describe "reviews/new", type: :view do
  before(:each) do
    assign(:review, Review.new(
      :title => "MyString",
      :description => "MyString",
      :rating => 1.5,
      :sfthouse => nil
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do

      assert_select "input[name=?]", "review[title]"

      assert_select "input[name=?]", "review[description]"

      assert_select "input[name=?]", "review[rating]"

      assert_select "input[name=?]", "review[sfthouse_id]"
    end
  end
end

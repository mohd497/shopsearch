require 'rails_helper'

RSpec.describe "interview_categories/new", type: :view do
  before(:each) do
    assign(:interview_category, InterviewCategory.new(
      :title => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new interview_category form" do
    render

    assert_select "form[action=?][method=?]", interview_categories_path, "post" do

      assert_select "input[name=?]", "interview_category[title]"

      assert_select "input[name=?]", "interview_category[description]"
    end
  end
end

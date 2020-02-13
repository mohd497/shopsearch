require 'rails_helper'

RSpec.describe "interview_categories/edit", type: :view do
  before(:each) do
    @interview_category = assign(:interview_category, InterviewCategory.create!(
      :title => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit interview_category form" do
    render

    assert_select "form[action=?][method=?]", interview_category_path(@interview_category), "post" do

      assert_select "input[name=?]", "interview_category[title]"

      assert_select "input[name=?]", "interview_category[description]"
    end
  end
end

require 'rails_helper'

RSpec.describe "interview_categories/index", type: :view do
  before(:each) do
    assign(:interview_categories, [
      InterviewCategory.create!(
        :title => "Title",
        :description => "Description"
      ),
      InterviewCategory.create!(
        :title => "Title",
        :description => "Description"
      )
    ])
  end

  it "renders a list of interview_categories" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end

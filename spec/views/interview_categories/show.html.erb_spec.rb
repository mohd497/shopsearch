require 'rails_helper'

RSpec.describe "interview_categories/show", type: :view do
  before(:each) do
    @interview_category = assign(:interview_category, InterviewCategory.create!(
      :title => "Title",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
  end
end

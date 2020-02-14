require 'rails_helper'

RSpec.describe "interview_questions/show", type: :view do
  before(:each) do
    @interview_question = assign(:interview_question, InterviewQuestion.create!(
      :question => "Question",
      :answer => "MyText",
      :interview_category => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Question/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end

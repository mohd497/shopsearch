require 'rails_helper'

RSpec.describe "interview_questions/index", type: :view do
  before(:each) do
    assign(:interview_questions, [
      InterviewQuestion.create!(
        :question => "Question",
        :answer => "MyText",
        :interview_category => nil
      ),
      InterviewQuestion.create!(
        :question => "Question",
        :answer => "MyText",
        :interview_category => nil
      )
    ])
  end

  it "renders a list of interview_questions" do
    render
    assert_select "tr>td", :text => "Question".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

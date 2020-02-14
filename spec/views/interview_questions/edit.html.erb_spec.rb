require 'rails_helper'

RSpec.describe "interview_questions/edit", type: :view do
  before(:each) do
    @interview_question = assign(:interview_question, InterviewQuestion.create!(
      :question => "MyString",
      :answer => "MyText",
      :interview_category => nil
    ))
  end

  it "renders the edit interview_question form" do
    render

    assert_select "form[action=?][method=?]", interview_question_path(@interview_question), "post" do

      assert_select "input[name=?]", "interview_question[question]"

      assert_select "textarea[name=?]", "interview_question[answer]"

      assert_select "input[name=?]", "interview_question[interview_category_id]"
    end
  end
end

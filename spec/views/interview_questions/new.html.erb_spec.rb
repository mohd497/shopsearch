require 'rails_helper'

RSpec.describe "interview_questions/new", type: :view do
  before(:each) do
    assign(:interview_question, InterviewQuestion.new(
      :question => "MyString",
      :answer => "MyText",
      :interview_category => nil
    ))
  end

  it "renders new interview_question form" do
    render

    assert_select "form[action=?][method=?]", interview_questions_path, "post" do

      assert_select "input[name=?]", "interview_question[question]"

      assert_select "textarea[name=?]", "interview_question[answer]"

      assert_select "input[name=?]", "interview_question[interview_category_id]"
    end
  end
end

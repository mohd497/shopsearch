require 'rails_helper'

RSpec.describe "jobs/edit", type: :view do
  before(:each) do
    @job = assign(:job, Job.create!(
      :title => "MyString",
      :description => "MyText",
      :salary_range => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit job form" do
    render

    assert_select "form[action=?][method=?]", job_path(@job), "post" do

      assert_select "input[name=?]", "job[title]"

      assert_select "textarea[name=?]", "job[description]"

      assert_select "input[name=?]", "job[salary_range]"

      assert_select "input[name=?]", "job[email]"
    end
  end
end

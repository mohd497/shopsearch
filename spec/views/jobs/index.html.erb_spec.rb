require 'rails_helper'

RSpec.describe "jobs/index", type: :view do
  before(:each) do
    assign(:jobs, [
      Job.create!(
        :title => "Title",
        :description => "MyText",
        :salary_range => "Salary Range",
        :email => "Email"
      ),
      Job.create!(
        :title => "Title",
        :description => "MyText",
        :salary_range => "Salary Range",
        :email => "Email"
      )
    ])
  end

  it "renders a list of jobs" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Salary Range".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end

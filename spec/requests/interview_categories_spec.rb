require 'rails_helper'

RSpec.describe "InterviewCategories", type: :request do
  describe "GET /interview_categories" do
    it "works! (now write some real specs)" do
      get interview_categories_path
      expect(response).to have_http_status(200)
    end
  end
end

require 'rails_helper'

RSpec.describe "InterviewQuestions", type: :request do
  describe "GET /interview_questions" do
    it "works! (now write some real specs)" do
      get interview_questions_path
      expect(response).to have_http_status(200)
    end
  end
end

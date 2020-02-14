require "rails_helper"

RSpec.describe InterviewQuestionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/interview_questions").to route_to("interview_questions#index")
    end

    it "routes to #new" do
      expect(:get => "/interview_questions/new").to route_to("interview_questions#new")
    end

    it "routes to #show" do
      expect(:get => "/interview_questions/1").to route_to("interview_questions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/interview_questions/1/edit").to route_to("interview_questions#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/interview_questions").to route_to("interview_questions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/interview_questions/1").to route_to("interview_questions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/interview_questions/1").to route_to("interview_questions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/interview_questions/1").to route_to("interview_questions#destroy", :id => "1")
    end
  end
end

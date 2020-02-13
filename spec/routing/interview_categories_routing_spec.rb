require "rails_helper"

RSpec.describe InterviewCategoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/interview_categories").to route_to("interview_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/interview_categories/new").to route_to("interview_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/interview_categories/1").to route_to("interview_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/interview_categories/1/edit").to route_to("interview_categories#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/interview_categories").to route_to("interview_categories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/interview_categories/1").to route_to("interview_categories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/interview_categories/1").to route_to("interview_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/interview_categories/1").to route_to("interview_categories#destroy", :id => "1")
    end
  end
end

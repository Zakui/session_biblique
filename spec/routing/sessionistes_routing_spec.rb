require "rails_helper"

RSpec.describe SessionistesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/sessionistes").to route_to("sessionistes#index")
    end

    it "routes to #new" do
      expect(:get => "/sessionistes/new").to route_to("sessionistes#new")
    end

    it "routes to #show" do
      expect(:get => "/sessionistes/1").to route_to("sessionistes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sessionistes/1/edit").to route_to("sessionistes#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/sessionistes").to route_to("sessionistes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sessionistes/1").to route_to("sessionistes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sessionistes/1").to route_to("sessionistes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sessionistes/1").to route_to("sessionistes#destroy", :id => "1")
    end
  end
end

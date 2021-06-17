require "rails_helper"

RSpec.describe SimpleBooksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/simple_books").to route_to("simple_books#index")
    end

    it "routes to #show" do
      expect(:get => "/simple_books/1").to route_to("simple_books#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/simple_books").to route_to("simple_books#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/simple_books/1").to route_to("simple_books#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/simple_books/1").to route_to("simple_books#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/simple_books/1").to route_to("simple_books#destroy", :id => "1")
    end
  end
end

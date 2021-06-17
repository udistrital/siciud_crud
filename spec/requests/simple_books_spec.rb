require 'rails_helper'

RSpec.describe "SimpleBooks", type: :request do
  describe "GET /simple_books" do
    it "works! (now write some real specs)" do
      get simple_books_path
      expect(response).to have_http_status(200)
    end
  end
end

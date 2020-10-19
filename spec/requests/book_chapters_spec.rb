require 'rails_helper'

RSpec.describe "BookChapters", type: :request do
  describe "GET /book_chapters" do
    it "works! (now write some real specs)" do
      get book_chapters_path
      expect(response).to have_http_status(200)
    end
  end
end

require 'rails_helper'

RSpec.describe "Sessionistes", type: :request do
  describe "GET /sessionistes" do
    it "works! (now write some real specs)" do
      get sessionistes_path
      expect(response).to have_http_status(200)
    end
  end
end

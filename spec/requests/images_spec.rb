require 'rails_helper'

RSpec.describe "Images", type: :request do
  describe "GET /" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /search?text=gnu" do
    let(:image_data) {
      {
        "id"=>"51108331847",
        "owner"=>"77017456@N03",
        "secret"=>"4571039b9f",
        "server"=>"65535",
        "farm"=>66,
        "title"=>"Wildebeest running and jumping",
        "ispublic"=>1,
        "isfriend"=>0,
        "isfamily"=>0
      }
    }

    it "returns photos list" do
      VCR.use_cassette("search") do
        get "/search", params: { text: "gnu" }
        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(JSON.parse(response.body)).to include(image_data)
      end
    end
  end
end

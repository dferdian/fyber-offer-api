require 'rails_helper'

RSpec.describe SitesController, type: :controller do

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "POST send_request" do

    before :each do
      stub_with_data
    end

    it "send request to api.sponsorpay.com" do
      post :send_request, { uid: 'player1', pub0: 'campaign2', page: 1 }
      expect(response.status).to eq(200)
    end

    it "renders the result view" do
      post :send_request, { uid: 'player1', pub0: 'campaign2', page: 1 }
      expect(response).to render_template(:send_request)
    end
  end
end

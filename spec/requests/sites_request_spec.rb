require 'rails_helper'

RSpec.describe "Mobile Offer Request", type: :request do

  describe "GET index" do

    it "has form asking for the uid" do
      get "/"
      expect(response.body).to include "uid *"
    end

    it "has form asking for pub0" do
      get "/"
      expect(response.body).to include "pub0"
    end

    it "has form asking for pub0" do
      get "/"
      expect(response.body).to include "page"
    end
  end

  describe "POST send_request" do

    it "has div with class 'offer' for response with data" do
      stub_with_data
      post '/sites/send_request', { uid: 'player1', pub0: 'campaign2', page: 1 }
      expect(response.body).to include "div class='offer'"
    end

    it "has title for response with data" do
      stub_with_data
      post '/sites/send_request', { uid: 'player1', pub0: 'campaign2', page: 1 }
      expect(response.body).to include "Grepolis - Jetzt kostenlos spielen!"
    end

    it "has payout for response with data" do
      stub_with_data
      post '/sites/send_request', { uid: 'player1', pub0: 'campaign2', page: 1 }
      expect(response.body).to include "111962"
    end

    it "has thumbnail lowres for response with data" do
      stub_with_data
      post '/sites/send_request', { uid: 'player1', pub0: 'campaign2', page: 1 }
      expect(response.body).to include "http://cdn4.sponsorpay.com/assets/9920/Grepolis_square_60.png"
    end

    it "has div with class 'no_offers' for response without data" do
      stub_without_data
      post '/sites/send_request', { uid: 'player1', pub0: 'campaign2', page: 1, device_id: '2b6f0cc904d137be2e1730235f5664094b831186' }
      expect(response.body).to include "div class='no_offers'"
    end

    it "has uid presence error if no uid params passed" do
      stub_with_uid_error
      post '/sites/send_request', { uid: '', pub0: 'campaign2', page: 1 }
      expect(response.body).to include "An invalid user id (uid) was given as a parameter in the request."
    end

    it "has appid presence error if no uid params appid" do
      stub_with_appid_error
      post '/sites/send_request', { uid: 'player1', pub0: 'campaign2', page: 1, appid: '' }
      expect(response.body).to include "An invalid application id (appid) was given as a parameter in the request."
    end

    it "has timestamp presence error if no uid timestamp passed" do
      stub_with_timestamp_error
      post '/sites/send_request', { uid: 'player1', pub0: 'campaign2', page: 1, timestamp: '' }
      expect(response.body).to include "An invalid or expired timestamp was given as a parameter in the request."
    end
  end
end

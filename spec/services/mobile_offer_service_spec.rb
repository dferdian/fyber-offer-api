require 'rails_helper'

describe MobileOfferService do

  before :each do
    stub_all
  end

  describe 'call API given valid attributes' do

    before :each do
      @mobile_offer = MobileOfferService.new(params_with_offers)
      @response = json(@mobile_offer.get_content)
    end

    it "has response code OK" do
      expect(@response["code"]).to eq('OK')
    end

    it "has 30 offers" do
      expect(@response["offers"].size).to eq(30)
    end

    it "has correct data" do
      expect(@response["offers"].first["title"]).to eq('Grepolis - Jetzt kostenlos spielen!')
    end

    it "has valid signature" do
      expect(@mobile_offer.signature_response).to eq(@mobile_offer.generated_response_hashkey)
    end
  end

  describe 'call API given invalid attributes' do

    before :each do
      @mobile_offer = MobileOfferService.new(params_no_offers)
      @response = json(@mobile_offer.get_content)
    end

    it "has response code OK" do
      expect(@response["code"]).to eq('NO_CONTENT')
    end

    it "has 30 offers" do
      expect(@response["offers"].size).to eq(0)
    end

    it "has correct data" do
      expect(@response["offers"]).to eq([])
    end

    it "has valid signature" do
      expect(@mobile_offer.signature_response).to eq(@mobile_offer.generated_response_hashkey)
    end
  end

  describe 'call API given invalid uid' do

    before :each do
      @mobile_offer = MobileOfferService.new(params_invalid_uid)
      @response = json(@mobile_offer.get_content)
    end

    it "has response code OK" do
      expect(@response["code"]).to eq('ERROR_INVALID_UID')
    end

    it "has no offers" do
      expect(@response["offers"]).to eq(nil)
    end

    it "has invalid signature" do
      expect(@mobile_offer.signature_response).to eq(nil)
    end
  end

  describe 'call API given invalid appid' do

    before :each do
      @mobile_offer = MobileOfferService.new(params_invalid_appid)
      @response = json(@mobile_offer.get_content)
    end

    it "has response code OK" do
      expect(@response["code"]).to eq('ERROR_INVALID_APPID')
    end

    it "has no offers" do
      expect(@response["offers"]).to eq(nil)
    end

    it "has invalid signature" do
      expect(@mobile_offer.signature_response).to eq(nil)
    end
  end

  describe 'call API given invalid timestamp' do

    before :each do
      @mobile_offer = MobileOfferService.new(params_invalid_timestamp)
      @response = json(@mobile_offer.get_content)
    end

    it "has response code OK" do
      expect(@response["code"]).to eq('ERROR_INVALID_TIMESTAMP')
    end

    it "has no offers" do
      expect(@response["offers"]).to eq(nil)
    end

    it "has invalid signature" do
      expect(@mobile_offer.signature_response).to eq(nil)
    end
  end
end

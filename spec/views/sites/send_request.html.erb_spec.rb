require 'rails_helper'

RSpec.describe "sites/send_request", type: :view do

  before :each do
    stub_all
  end

  it "displays the forms and show correct title" do
    mobile_offer = MobileOfferService.new(params_with_offers)

    assign(:content_response, mobile_offer.get_content)
    assign(:signature_response, mobile_offer.signature_response)
    assign(:generated_response_hashkey, mobile_offer.generated_response_hashkey)

    render
    expect(rendered).to match /Fyber Mobile Offer/
  end

  it "displays returned result" do
    mobile_offer = MobileOfferService.new(params_with_offers)

    assign(:content_response, mobile_offer.get_content)
    assign(:signature_response, mobile_offer.signature_response)
    assign(:generated_response_hashkey, mobile_offer.generated_response_hashkey)

    render
    expect(rendered).to match /Grepolis - Jetzt kostenlos spielen!/
  end

  it "displays returned no offers" do
    mobile_offer = MobileOfferService.new(params_no_offers)

    assign(:content_response, mobile_offer.get_content)
    assign(:signature_response, mobile_offer.signature_response)
    assign(:generated_response_hashkey, mobile_offer.generated_response_hashkey)

    render
    expect(rendered).to match /No offers/
  end

  it "displays error for uid not presence" do
    mobile_offer = MobileOfferService.new(params_invalid_uid)

    assign(:content_response, mobile_offer.get_content)
    assign(:signature_response, mobile_offer.signature_response)
    assign(:generated_response_hashkey, mobile_offer.generated_response_hashkey)

    render
    expect(rendered).to match /An invalid user id/
  end

  it "displays error for appid not presence" do
    mobile_offer = MobileOfferService.new(params_invalid_appid)

    assign(:content_response, mobile_offer.get_content)
    assign(:signature_response, mobile_offer.signature_response)
    assign(:generated_response_hashkey, mobile_offer.generated_response_hashkey)

    render
    expect(rendered).to match /An invalid application id/
  end

  it "displays error for timestamp not presence" do
    mobile_offer = MobileOfferService.new(params_invalid_timestamp)

    assign(:content_response, mobile_offer.get_content)
    assign(:signature_response, mobile_offer.signature_response)
    assign(:generated_response_hashkey, mobile_offer.generated_response_hashkey)

    render
    expect(rendered).to match /An invalid or expired timestamp was given as a parameter in the request./
  end
end

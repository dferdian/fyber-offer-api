require 'rails_helper'

RSpec.describe "sites/index", type: :view do

  it "displays the forms and show correct title" do
    render
    expect(rendered).to match /Fyber Mobile Offer/
  end

  it "displays the forms and show uid field" do
    render
    expect(rendered).to match /uid*/
  end

  it "displays the forms and show pub0 field" do
    render
    expect(rendered).to match /pub0/
  end

  it "displays the forms and show page field" do
    render
    expect(rendered).to match /page/
  end
end

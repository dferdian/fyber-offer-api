require 'rails_helper'

feature "User should be able to see form asking for uid, pub0 and page" do

  scenario "User should be able to see title of the page" do
    visit root_path
    expect(page).to have_content('Fyber Mobile Offer')
  end

  scenario "User should be able to see uid input field" do
    visit root_path
    expect(page).to have_field('uid')
  end

  scenario "User should be able to see pub0 input field" do
    visit root_path
    expect(page).to have_field('pub0')
  end

  scenario "User should be able to see page input field" do
    visit root_path
    expect(page).to have_field('page')
  end
end


feature "User should be able to submit the form and get the offer data" do
  before :each do
    stub_all
  end

  scenario "User should be able to see result of offers" do
    visit root_path
    fill_in 'uid', with: 'player1'
    fill_in 'pub0', with: 'campaign2'
    fill_in 'page', with: '1'
    click_button 'Send'

    expect(page).to have_content('Fyber Mobile Offer')
    expect(page).to have_content('Grepolis - Jetzt kostenlos spielen!')
    expect(page).to have_content('111962')
  end
end

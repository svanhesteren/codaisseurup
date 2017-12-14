require "rails_helper"

describe "Terms and conditions page" do
  it "shows the terms and conditions page" do
    visit root_url
    click_on "Terms"
    expect(page).to have_content("Terms and Conditions")
  end

end

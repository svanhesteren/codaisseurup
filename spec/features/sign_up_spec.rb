require "rails_helper"

describe "Signing up" do
  before do
    visit root_url
    click_on "Sign Up"  #reminder Up is with a capital, not the others.
    fill_in "user_email", with: "mail@codaisseur.com"
  end

  context "when password is too short" do
    it "does not allow the user to sign up " do
      fill_in "user_password", with: "short"
      click_on "Sign up"
      expect(page).to have_content "Password is too short"
    end
  end

  context "when password is long enough" do
    it "allowes the user to sign up" do
      fill_in "user_password", with: "habahaba"
      click_on "Sign up"
      expect(page).to have_content "Welcome! You have signed up successfully."
    end
  end
end

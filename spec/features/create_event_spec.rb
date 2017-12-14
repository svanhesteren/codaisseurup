require "rails_helper"

describe "Creating an event" do
  let(:user) {create :user}
  before do
    login_as user
    visit events_url
    click_on "Add new event"
  end

  context "when event is properly filled in" do
    it "allows event to be created" do

      fill_in "event_name", with: "event 1"
      fill_in "event_location", with: "loc 1"
      select("Dance", :from => "event_category")
      fill_in "event_description", with: "some bio"

      click_on "Save"
      expect(page).to have_content "Event successfully created"
    end
  end

  context "when event is not properly filled in" do
    it "allows event not to be created" do
      click_on "Save"
      expect(page).to have_content "Error!"
    end
  end


end

require "rails_helper"

describe "user association with event(s)" do

  let(:user) { create :user }
  let!(:event) { create :event, user: user }

  it "has many events" do
    event1 = user.events.new(name: "Wonderful")
    event2 = user.events.new(name: "Extraordinary")

    expect(user.events).to include(event1)
    expect(user.events).to include(event2)
  end

  it "deletes associated events" do
    expect { user.destroy }.to change(Event, :count).by(-1)
  end

end

describe "user association with profile" do
  let(:user) {create :user}
  # let!(:event) {create :event, :user => user}
  let!(:profile) {create :profile, user: user}

  context "user.destroy" do
    it "deletes associated profile" do
      expect {user.destroy}.to change(Profile, :count).by(-1)
    end
  end

end

  describe "association with registration" do
    let(:guest_user) { create :user, email: "guest@user.com" }
    let(:host_user) { create :user, email: "host@user.com" }

    let!(:event) { create :event, user: host_user }
    let!(:registration) { create :registration, event: event, user: guest_user }

    it "has registration" do
      expect(guest_user.registered_events).to include(event)
    end

  end

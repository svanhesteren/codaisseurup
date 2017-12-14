require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe ".by_initial" do
    subject { Profile.by_initial("S") }
    let(:user) {create :user }
    let(:sander) { create :profile, first_name: "Sander", user: user }
    let(:stefan) { create :profile, first_name: "Stefan", user: user }
    let(:wouter) { create :profile, first_name: "Wouter", user: user }

    context "matching letters" do
      it "returns the profiles that match the initial" do
        expect(subject).to match_array([stefan, sander])
      end
    end

    context "non-matching letters" do
      it "is sorted on first_name" do
        expect(subject).to eq([sander, stefan])
      end
    end
  end

  describe "profile association with user" do
    let(:user) { create :user }
    let(:profile) {create :profile, user: user}
    it "belongs to a user" do
      # profile = user.profile.create(full_name: "Bert", last_name: "van der Berg", bio:"hehe")
      expect(profile.user).to eq(user)
    end
  end
end

require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe "validations" do
    let(:user) {build :user}
    let!(:event) {build :event, user: user}

    it "is invalid without event" do
      photo = Photo.new(event: nil)
      photo.valid?
      expect(photo.errors).to have_key(:event)
    end
    it "is invalid without an image" do
      photo = Photo.new(event: event, image: "")
      photo.valid?
      expect(photo.errors).to have_key(:image)
    end

  end
  pending "add some examples to (or delete) #{__FILE__}"

end

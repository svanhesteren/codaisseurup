require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    let(:user) {build :user}
    # let(:event) {build :event, user: user}
    # resence: true
    # validates :description, presence: true, length: {maximum: 500}
    # validates :starts_at, presence: true
    # validates :ends_at, presence: true
    # validates :category, presence: true
    # validate :ends_at_before_starts_at
    # it { is_expected.to validate_presence_of(:name) }
    #
    # it { is_expected.to validate_presence_of(:location) }

    it "is invalid without name" do
      event = Event.new(name: "")
      event.valid?
      expect(event.errors).to have_key(:name)
    end

    it "is invalid without starts at" do
      event = Event.new(starts_at: "")
      event.valid?
      expect(event.errors).to have_key(:starts_at)
    end

    it "is invalid without ends at" do
      event = Event.new(ends_at: "")
      event.valid?
      expect(event.errors).to have_key(:ends_at)
    end

    it "is invalid without category" do
      event = Event.new(category: "")
      event.valid?
      expect(event.errors).to have_key(:category)
    end

    it "is invalid without description" do
      event = Event.new(description: "")
      event.valid?
      expect(event.errors).to have_key(:description)
    end

    it "is invalid when ends_at is the same or earlier then starts_at" do
      moment = DateTime.current
      event = Event.new(starts_at: moment, ends_at: moment-1)
      expect(event.ends_at_before_starts_at).to eq(true)
    end

    it "is invalid with a description longer than 500 characters" do
      event = Event.new(description: "a" * 600)
      event.valid?
      expect(event.errors).to have_key(:description)

    end

    it "is a bargain if price is lower then $20" do
      event = Event.new(price: 19)
      exp_event = Event.new(price: 50)
      expect(event.bargain?).to eq(true)
      expect(exp_event.bargain?).to eq(false)
    end

  end


  describe ".order_by_price" do
    #??????????
    # event1 = Event.new(price: 200)
    # event2 = Event.new(price: 1500)
    # event3 = Event.new(price: 40)
    let!(:event1) { create :event, price: 100 }
    let!(:event2) { create :event, price: 200 }
    let!(:event3) { create :event, price: 50 }

    it "returns a sorted array of rooms by prices" do
      # note that they should not come out in the order that they were created
      expect(Event.order_by_price).to eq([event3, event1, event2])
    end
  end
  # it "returns sorted array of prices" do
  #   expect(Event.order_by_price).to eq([event3, event1, event2])
  #
  # end

  describe "association with user" do
    let(:user) { create :user }

    it "belongs to a user" do
      event = user.events.build(name: "Party yay")

      expect(event.user).to eq(user)
    end
  end


  describe "association with theme" do
    let(:event) { create :event }

    let(:theme1) { create :theme, name: "Bright", events: [event] }
    let(:theme2) { create :theme, name: "Clean lines", events: [event] }
    let(:theme3) { create :theme, name: "A Man's Touch", events: [event] }

    it "has themes" do
      expect(event.themes).to include(theme1)
      expect(event.themes).to include(theme2)
      expect(event.themes).to include(theme3)
    end

    # Or we do it the shoulda way:
    # it { is_expected.to have_and_belong_to_many :themes }
  end

  describe "association with registration" do
    let(:guest_user) { create :user, email: "guest@user.com" }
    let(:host_user) { create :user, email: "host@user.com" }

    let!(:event) { create :event, user: host_user }
    let!(:registration) { create :registration, event: event, user: guest_user }

    it "has guests" do
      expect(event.guests).to include(guest_user)
    end
  end

end

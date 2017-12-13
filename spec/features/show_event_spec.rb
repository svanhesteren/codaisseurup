require 'rails_helper'

describe "Viewing an individual event" do
  let(:user) { create :user}
  let(:event) { create :event, user: user }

  it "shows the event's details" do
    visit event_url(event)

    expect(page).to have_text(event.name)
    expect(page).to have_text(event.description)
    expect(page).to have_text(event.location)
    expect(page).to have_text(event.capacity)
    expect(page).to have_text(event.price)
    expect(page).to have_text(event.category)
    expect(page).to have_text(event.starts_at.to_formatted_s(:short))
    expect(page).to have_text(event.ends_at.to_formatted_s(:short))
    expect(page).to have_text(event.includes_food ? "Yes" : "No")
    expect(page).to have_text(event.includes_drinks ? "Yes" : "No")
  end
end

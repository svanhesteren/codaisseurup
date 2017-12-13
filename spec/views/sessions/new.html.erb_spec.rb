require "rails_helper"

describe "sessions/new.html.erb" do
  before { sign_in user }

  context "without signed in" do

    it "renders log in screen" do
      render
      expect(rendered)
    end
  end
end

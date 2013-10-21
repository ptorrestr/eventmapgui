require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Event Map'" do
      visit root_path
      expect(page).to have_content('Event Map')
    end

    it "should have the title 'Home'" do
      visit root_path
      expect(page).to have_title("Event Map | Home")
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit help_path
      expect(page).to have_title("Event Map | Help")
    end
  end
end

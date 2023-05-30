require 'rails_helper'
require 'capybara/rspec'

RSpec.describe "Messages", type: :feature do
  include Capybara::DSL
  describe "Creating a new message" do
    it "displays the created message on the index page" do
      visit messages_path

      fill_in "message_content", with: "mensaje test"
      click_button "Create Message"

      expect(page).to have_content("mensaje test",wait: 5)
    end

    it "displays an error message if content is blank" do
      visit messages_path

      click_button "Create Message"
      
      expect(page).to have_content("1 error prohibited this message from being saved:")
      
      expect(page).to have_content("Content can't be blank")
    end
  end
end

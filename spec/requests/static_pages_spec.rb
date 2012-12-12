require 'spec_helper'

describe "StaticPages" do

  subject { page }
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "Home Page" do
    before { visit root_path }
    it { should have_selector('h1', text: 'Sample App') }
    it { should have_selector('title', text: "#{base_title}") }
    it { should_not have_selector('title', text: '|') }
    it "should have the right links on layout" do
      click_link "About"
      page.should have_selector('title', text: "#{base_title} | About Us")
      click_link "Contact"
      page.should have_selector('title', text: "#{base_title} | Contact")
      click_link "Home"
      click_link "Sign up now!"
      page.should have_selector('title', text: "#{base_title} | Sign up")
      click_link "sample app"
      page.should have_selector('title', text: "#{base_title}")
    end
  end

  describe "Help Page" do
    before { visit help_path }
    it { should have_selector('h1', text: 'Help') }
    it { should have_selector('title', text:  "#{base_title} | Help") }
  end

  describe "About Page" do
    before { visit about_path }
    it { should have_selector('h1', text: 'About Us') }
    it { should have_selector('title', text: "#{base_title} | About Us") }
  end
  
  describe "Contact Page" do
    before { visit contact_path }
    it { should have_selector('h1', text: 'Contact') }
    it { should have_selector('title', text: "#{base_title} | Contact") }
  end
end

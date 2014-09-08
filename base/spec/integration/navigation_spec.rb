require 'spec_helper'

describe "Navigation" do
  include Capybara
  
  it "should be a valid app" do
    ::Rails.application.should be_a(Dummy::Application)
  end

  context "logged in", :js => true do
    before(:all) do
      @user = create(:user)

      visit root_path
      fill_in 'user_email', :with => @user.email
      fill_in 'user_password', :with => 'testing'

      click_button 'Sign in'
    end

    context "with other user" do
      before do
        create(:user)
      end

      it "should close tab" do
        visit home_path
        click_link "X"
      end
    end
  end
end

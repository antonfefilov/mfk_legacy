
require 'spec_helper'

describe "admin/users/new.html.erb" do
  context "render the form for the new user creation" do
    before(:each) do
      assign(:user, stub_model(User))
    end

    it "have input field for a username" do
      render
      rendered.should have_selector("form input[@id='user_username']")
    end
    
    it "have input field for a email" do
      render
      rendered.should have_selector("form input[@id='user_email']")
    end
    
    it "have input field for a password" do
      render
      rendered.should have_selector("form input[@id='user_password']")
    end
    
    it "have input field for a password confirmation" do
      render
      rendered.should have_selector("form input[@id='user_password_confirmation']")
    end

  end
end

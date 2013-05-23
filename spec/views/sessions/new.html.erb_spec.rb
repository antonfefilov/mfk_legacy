require 'spec_helper'

describe "sessions/new.html.erb" do
  context "render the form for the login" do
    it "have input field for a email" do
      render
      rendered.should have_selector("form input[@id='email']")
    end
    
    it "have input field for a password" do
      render
      rendered.should have_selector("form input[@id='password']")
    end
  end
end

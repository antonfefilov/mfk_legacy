# coding: utf-8
require "spec_helper"

feature "User management" do
  # As a site administrator
  # In order to 
  # I want to create new, edit and delete users  
  scenario "Admin create new user (success)" do 
    visit "/admin/users"
   
    click_link "Новый пользователь"
   
    fill_in "user_email", :with => "lofdur@gmail.com"
    fill_in "user_username", :with => "HaulTheCrusader"
    fill_in "user_password", :with => "q1w2e3"
    fill_in "user_password_confirmation", :with => "q1w2e3"
    click_button "Сохранить"

    page.should have_content "The user was successfully created"
  end
  
  scenario "Admin create new user (fails)" do 
    visit "/admin/users"
   
    click_link "Новый пользователь"
   
    fill_in "user_email", :with => "lof-+=ur@gmail.com"
    fill_in "user_username", :with => "HaulTheCrusader"
    click_button "Сохранить"

    page.should have_no_content "The user was successfully created"
  end

  scenario "Admin edit user (success)" do
    Fabricate(:user, username: "Alex", email: "alex@example.com", password_digest: "anydigest")
    visit "/admin/users"

    click_link "Edit"
    
    fill_in "user_username", :with => "HaulTheCrusader"
    click_button "Сохранить"

    page.should have_content "The user was successfully updated"
  end

  scenario "Admin edit user (fails)" do
    Fabricate(:user, username: "Alex", email: "alex@example.com", password_digest: "anydigest")
    visit "/admin/users"

    click_link "Edit"
    
    fill_in "user_username", :with => "+=HaulTheCrusader=+"
    click_button "Сохранить"

    page.should have_no_content "The user was successfully updated"
  end

  scenario "Admin destroy user", :js => true do
    Fabricate(:user, username: "Alex", email: "alex@example.com", password_digest: "anydigest")
    visit "/admin/users"
     
    click_link "Destroy"
    page.driver.browser.switch_to.alert.accept

    page.should have_content "The user was successfully deleted"
  end

  scenario "Admin look at users information" do
    Fabricate(:user, username: "Alex", email: "alex@example.com", password_digest: "anydigest")
    visit "/admin/users"

    click_link "alex@example.com" 
    
    page.should have_content "Электронный адрес: alex@example.com"    
  end
end

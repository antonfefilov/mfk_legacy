# coding: utf-8
require "spec_helper"

feature "User management" do
  # As a site administrator
  # In order to 
  # I want to create new, edit and delete users  
  background do
    admin_user = Fabricate(:user, username: "Haul", email: "lofdur@gmail.com", password: "q1w2e3")
    admin_role = Fabricate(:role, name: "admin")
    admin_user.roles << admin_role
  
    visit "/login"

    fill_in "email", :with => "lofdur@gmail.com"
    fill_in "password", :with => "q1w2e3"
    click_button "Войти"
  end 
  
  given (:user) { Fabricate(:user, username: "Alex", email: "alex@example.com", password_digest: "anydigest") }
  
  scenario "Admin create new user (success)" do 
    visit "/admin/users"
   
    click_link "Новый пользователь"
   
    fill_in "user_email", :with => "testuser@gmail.com"
    fill_in "user_username", :with => "HaulTheCrusader"
    fill_in "user_password", :with => "testpass"
    fill_in "user_password_confirmation", :with => "testpass"
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
    visit edit_admin_user_path(user)
    
    fill_in "user_username", :with => "HaulTheCrusader"
    click_button "Сохранить"

    page.should have_content "The user was successfully updated"
  end

  scenario "Admin edit user (fails)" do
    visit edit_admin_user_path(user)
    
    fill_in "user_username", :with => "+=HaulTheCrusader=+"
    click_button "Сохранить"

    page.should have_no_content "The user was successfully updated"
  end

  scenario "Admin destroy user", :js => true do
    pending
    # visit "/admin/users"
     
    # path = admin_user_path(user)
    # page.find(:xpath, './/a[@href=#{path}]').click

    # page.driver.browser.switch_to.alert.accept

    # page.should have_content "The user was successfully deleted"
  end

  scenario "Admin look at users information"do
    visit admin_user_path(user)
    
    page.should have_content "Электронный адрес: alex@example.com"    
  end
end

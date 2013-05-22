require 'spec_helper'

describe "admin/users/index.html.erb" do
  it "displays all the users" do
    assign(:users, [
      stub_model(User, username: "Alex", email: "alex@example.com"),
      stub_model(User, username: "Frodo", email: "frodo@example.com")
    ]) 

    render

    rendered.should have_content("Frodo") 
    rendered.should have_content("Alex") 
    rendered.should have_content("alex@example.com") 
    rendered.should have_content("frodo@example.com") 
  end
end

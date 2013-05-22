require 'spec_helper'

describe Admin::UsersController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      user = Fabricate(:user, username: "Alex", email: "alex@example.com", password_digest: "anydigest") 
      get 'edit', :id => user.id
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      user = Fabricate(:user, username: "Alex", email: "alex@example.com", password_digest: "anydigest") 
      get 'show', :id => user.id
      response.should be_success
    end
  end
end

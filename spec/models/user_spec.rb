# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

require 'spec_helper'

describe User do
  let (:user) { Fabricate.build(:user, username: "Alex", email: "alex@example.com", password_digest: "anydigest")}
  subject { user }

  it { should respond_to(:username) } 
  it { should respond_to(:email) } 
  it { should respond_to(:password_digest) }
  it { should respond_to(:has_role?)}

  it { should be_valid }

  describe "when username is not present" do
    before { user.username = ""}
    it {should_not be_valid}
  end

  describe "when email is not present" do
    before { user.email = ""}
    it {should_not be_valid}
  end

  describe "when password_digest is not present" do 
    before { user.password_digest = "" }
    it { should_not be_valid }
  end

  describe "when username format is invalid" do
    it "should be invalid" do
      usernames = %w[al?ex mi=mi=no bo this_username_is_longer_than_20_characters]
      usernames.each do |invalid_username|
        user.username = invalid_username
        user.should_not be_valid
      end  
    end
  end

  describe "when username format is valid" do
    it "should be valid" do
      usernames = %w[al_ex mi-mi.no bo567 shorter21characters]
      usernames.each do |valid_username|
        user.username = valid_username
        user.should be_valid
      end  
    end
  end
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        user.email = invalid_address
        user.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        user.email = valid_address
        user.should be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_duplicated_email = user.dup
      user_with_duplicated_email.email = user.email.upcase
      user_with_duplicated_email.save
    end
    it { should_not be_valid} 
  end

  describe "when username is already taken" do
    before do
      user_with_duplicated_username = user.dup
      user_with_duplicated_username.save
    end
    it { should_not be_valid }
  end

  describe "#has_role?" do
    specify do
      role = Fabricate(:role, name: "anyrole")
      user.roles << role 
      user.has_role?("anyrole").should be_true
    end
  end

end

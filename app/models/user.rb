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

class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_USERNAME_REGEX = /\A[A-Za-z][A-Za-z0-9._-]{2,19}\z/
  
  has_secure_password

  validates :username, presence: true, format: { with: VALID_USERNAME_REGEX },
                    uniqueness: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } 

  before_save { |user| user.email = email.downcase }
end

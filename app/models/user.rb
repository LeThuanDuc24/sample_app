class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximun: 50 },
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximun: 50 },
                    format: { with: VALID_EMAIL_REGEX }
                    uniqueness: true    #~case_sensitive: false
  has_secure_password
  validates :password, presence: true, length: { minimun: 6, maximun: 18 }
end

class User < ApplicationRecord

  has_secure_password
  #validations
  validates :email, :presence => true, :uniqueness => true

  #association
  has_many :auth_tokens
  has_many :posts
  has_many :friends

  enum ac_status: {inactive: 0, active: 1}

end

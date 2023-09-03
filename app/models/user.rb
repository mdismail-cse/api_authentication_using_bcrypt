class User < ApplicationRecord

  #validations
  validates :email, :presence => true, :uniqueness => true


  has_secure_password

  has_many :auth_tokens

end

class Post < ApplicationRecord
  #validation
  validates :title, :description, presence: true
  validates :title, length: {minimum: 10, maximum: 100 }
  #associations
  belongs_to :user

end

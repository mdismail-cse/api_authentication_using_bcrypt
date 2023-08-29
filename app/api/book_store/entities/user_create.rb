
module BookStore
  module Entities
    class UserCreate < Grape::Entity
      expose :name
      expose :email
      expose :status
    end
  end
end

module BookStore
  module Entities
    class UserCreate < Grape::Entity
      expose :name
      expose :email
      expose :ac_status
    end
  end
end
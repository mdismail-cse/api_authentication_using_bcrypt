
module BookStore
  module Entities
    class User < Grape::Entity
      expose :name
      expose :email
      expose :token
      expose :status
    end
  end
end
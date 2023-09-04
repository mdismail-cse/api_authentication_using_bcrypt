
module BookStore
  module Entities
    class User < Grape::Entity
      expose :name
      expose :email
      expose :token
      expose :ac_status
    end
  end
end
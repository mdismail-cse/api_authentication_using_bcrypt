
module BookStore
  module Entities
    class Login < Grape::Entity
      expose :token
      expose :expire_at
    end
  end
end
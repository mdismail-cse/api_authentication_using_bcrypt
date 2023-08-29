
module BookStore
  module Entities
    class Activation < Grape::Entity
      expose :name
      expose :email
      expose :status
      expose :created_at
    end
  end
end
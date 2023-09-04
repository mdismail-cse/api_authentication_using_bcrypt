
module BookStore
  module Entities
    class Activation < Grape::Entity
      expose :name
      expose :email
      expose :ac_status
      expose :created_at
    end
  end
end
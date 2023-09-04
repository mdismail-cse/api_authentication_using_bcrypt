
module BookStore
  module Entities
    class SinglePost < Grape::Entity
      expose :title
      expose :description
      expose :user_id
    end
  end
end
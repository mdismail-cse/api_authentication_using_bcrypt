
module BookStore
  module Entities
    class PostCreate < Grape::Entity
      expose :id
      expose :title
    end
  end
end
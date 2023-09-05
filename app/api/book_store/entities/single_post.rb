module BookStore
  module Entities
    class SinglePost < Grape::Entity
      expose :title
      expose :description
      expose :user_name

      def user_name
        user = object.user
        { name: user&.name,
          id: user&.id
        }
      end
    end
  end
end


  module BookStore
    module QueryParams
      module UserParams
      extend  ::Grape::API::Helpers

      params :create_user_params do
        requires :name, type: String
        requires :email, type: String
        requires :password, type: String
      end

      params :user_login_params  do
        requires :email, type: String
        requires :password, type: String
      end

      params :change_user_password_params do
        requires :old_password, type: String
        requires :new_password, type: String
        requires :confirm_password, type: String
      end


      params :reset_user_password_params do
        requires :token , type:String
        requires :new_password , type:String
        requires :confirm_password , type:String
      end



      end
    end
  end

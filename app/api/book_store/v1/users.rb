module BookStore
  module V1
    class Users < Base

      helpers BookStore::QueryParams::UserParams

      version 'v1', using: :path
      format :json
      prefix :api


      resource :users do
        desc 'Return list of books'
        get do
          users = User.all
          present users
        end



        desc 'create a new user'
        params do
          use :create_user_params
        end
        route_setting :authentication, optional: true
        post do
          user = User.new(params)
          if user.save
            @token = user.signed_id(purpose: "activation", expires_in: 60.minutes)
            UserMailer.account_activation(@token, user).deliver_now
            status 200
            present user, with: BookStore::Entities::UserCreate
          else
            error!('Not accepted', 406)
          end
        rescue StandardError => error
          Rails.logger.info "#{error.full_message}"
          error!("Internal Server error", :internal_server_error)
        end



        desc 'logging in'
        params do
          use :user_login_params
        end
        route_setting :authentication, optional: true
        post 'login' do
          @user = User.find_by!(email: params[:email])
          error!('User not found', :not_found) if @user.nil?

          unless @user && @user.authenticate(params[:password]) && @user.ac_status == "active"
            error!('Failed to login account not activated ', 401)
          end

          @token = @user.signed_id(purpose: "login", expires_in: 60.minutes)
          @auth_token = AuthToken.new(user_id: @user.id, token: @token, expire_at: DateTime.now+60.minutes)
          # debugger
          @auth_token.save!
          present @auth_token, with: BookStore::Entities::Login

        rescue StandardError => error
          error!("Internal Server error", :internal_server_error)
        end


        desc 'logout user'
        get 'logout' do
          @user = User.find_signed(request.headers["Authorization"], purpose: "login")
          error!('Unauthorized', :unauthorized) if @user.nil?

          @auth_token = @user.auth_tokens.where(token: request.headers["Authorization"])
          error!('You are not logged in', :forbidden) if @auth_token.nil?
          @auth_test = @user.auth_tokens.find_by(token: request.headers["Authorization"])
          @auth_test.destroy
          status 200
          # present @user, with: BookStore::Entities::User

        end


        desc 'password change'
        params do
          use :change_user_password_params
        end
        put 'change_password' do
          # @user = User.find_signed(request.headers["Authorization"], purpose: "login")
          # error!('not authorized', :unauthorized) if @user.nil?

          if @user && @user.authenticate(params[:old_password])
            @user.update(password: params[:new_password])
            { message: 'Password changed successfully' }
            present @user, with: BookStore::Entities::User

          else
            error!('Invalid credentials', 401)
          end

        rescue StandardError => error
          error!("#{error.message}", :internal_server_error)
        end

        desc 'reset password link create'
        params do
          requires :email , type:String
        end
        route_setting :authentication, optional: true
        post 'forget_password' do
          @user = User.find_by(email: params[:email])
          error!('not found', :not_found) if @user.nil?
          @token = @user.signed_id(purpose: "reset password", expires_in: 60.minutes)
          UserMailer.password_reset(@token, @user).deliver_now
          status 200

        rescue StandardError => error
          error!("#{error.message}", :internal_server_error)
        end

        desc 'reset password'
        params do
          use :reset_user_password_params
        end
        route_setting :authentication, optional: true
        put 'reset_password' do
          @user = User.find_signed!(params[:token], purpose: "reset password")
          error!('unauthorized', :unauthorized) if @user.nil?
          # present params[:token]
          if params[:new_password] == params[:confirm_password]
            @user.update(password: params[:new_password])
            status 200
            {message: 'password successfully updated'}
          else
            error!('Failed to update', 500)
          end
        rescue StandardError => error
          error!("Internal Server error", :internal_server_error)

        end


        desc 'account activation'
        params do
          requires :token, type:String
        end
        route_setting :authentication, optional: true
        put 'account_activation' do

          @user = User.find_signed!(params[:token], purpose: "activation")
          error!('unauthorized', :unauthorized) if @user.nil?

          @user.update(ac_status: "active")

          status 200
          present @user, with: BookStore::Entities::Activation
        rescue StandardError => error
          error!("Internal Server error", :internal_server_error)

        end


        desc 'reconfirm account'
        params do
          requires :email, type:String
        end
        route_setting :authentication, optional: true
        post 'reconfirm_account' do
          @user = User.find_by(email: params[:email])

          if @user.present? && @user.ac_status == "inactive"

            @token = @user.signed_id(purpose: "activation", expires_in: 60.minutes)
            UserMailer.account_activation(@token, @user).deliver_now
            status 200

            present @user, with: BookStore::Entities::UserCreate
          else
            if @user.ac_status == "active"
              {message: "already activated"}
            else

            error!('not found', :unauthorized)
            end
          end

        rescue StandardError => error
          Rails.logger.info "#{error.full_message}"
          error!("Internal Server error", :internal_server_error)

        end


      end
    end
  end
end
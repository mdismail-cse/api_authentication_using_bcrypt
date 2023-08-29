module BookStore
  module V1
    class Users < Grape::API
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
          requires :name, type: String
          requires :email, type: String
          requires :password, type: String
        end
        post do

          user = User.new(params)

          present user if user.save

        end



        desc 'logging in'
        params do
          requires :email, type: String
          requires :password, type: String
        end
        post 'login' do
          @user = User.find_by(email: params[:email])
          error!('User not found', :not_found) if @user.nil?

          if @user && @user.authenticate(params[:password])
            @token = @user.signed_id(purpose: "login", expires_in: 60.minutes)
            @user.token = @token
            @user.save!
            present user: @user, token: @token
          end

        end


        desc 'logout user'
        get 'logout' do
          @user = User.find_signed(request.headers["Authorization"], purpose: "login")
          error!('Forbidden', :forbidden) if @user.nil?
          @user.token = nil
          @user.save
          present @user
        end


        desc 'password change'
        params do
          requires :old_password, type: String
          requires :new_password, type: String
          requires :confirm_password, type: String
        end
        put 'change_password' do
          @user = User.find_signed(request.headers["Authorization"], purpose: "login")
          error!('not authorized', :unauthorized) if @user.nil?

          if @user && @user.authenticate(params[:old_password])
            @user.update(password: params[:new_password])
            { message: 'Password changed successfully' }
          else
            error!('Invalid credentials', 401)
          end

        end



        desc 'reset password link create'
        params do
          requires :email , type:String
        end
        post 'forget_password' do

          @user = User.find_by(email: params[:email])
          error!('not found', :not_found) if @user.nil?
          @token = @user.signed_id(purpose: "reset password", expires_in: 60.minutes)

          UserMailer.password_reset(@token).deliver_now

          present @token


        end

        desc 'reset password'
        params do
          requires :token , type:String
          requires :new_password , type:String
          requires :confirm_password , type:String
        end
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

        end




      end
    end
  end
end
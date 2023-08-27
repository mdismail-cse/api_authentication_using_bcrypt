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

          user = User.new({ name:params[:name], email:params[:email],password:params[:password]})

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
            @user.save
            debugger
            present user: @user, token: @token

          end

        end


        desc 'logout user'
        get 'logout' do
          @user = User.find_signed(request.headers["Authorization"], purpose: "login")
          @user.token = nil
          @user.save
          present @user
        end

      end
    end
  end
end
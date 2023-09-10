module BookStore
  class Base < Grape::API

    before do
      auth_optional = route&.settings&.dig(:authentication, :optional)
      if auth_optional
        Rails.logger.info 'Authentication optional for this endpoint'
      else
        @user = User.find_signed(request.headers["Authorization"], purpose: "login")
        error!('not authorized', :unauthorized) if @user.nil?

        @user_friend_request = @user.friends.where(status: "unaccepted")
        @user_friends = @user.friends.where(status: "accepted")
        # debugger
      end

    end


    mount BookStore::V1::Users
    mount BookStore::V1::Posts
    mount BookStore::V1::Comments
    mount BookStore::V1::Friends
  end
end
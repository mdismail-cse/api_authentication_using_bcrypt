module BookStore
  class Base < Grape::API

    before do
      auth_optional = route&.settings&.dig(:authentication, :optional)
      if auth_optional
        Rails.logger.info 'Authentication optional for this endpoint'
      else
        @user = User.find_signed(request.headers["Authorization"], purpose: "login")
        error!('not authorized', :unauthorized) if @user.nil?
      end

    end


    mount BookStore::V1::Users
    mount BookStore::V1::Posts
  end
end
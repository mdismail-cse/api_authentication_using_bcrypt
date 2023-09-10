module BookStore
  module V1
    class Friends < Base

      version 'v1', using: :path
      format :json
      prefix :friend


      resource :friends do
        desc 'send friend request'
        params do
          requires :request_id , type:Integer
        end
        post  do
          @request_id = User.find_by(id: params[:request_id])
          error!("requested user not found", :not_found) if @request_id.nil? && @request_id.id != @user.id

          friend_request = Friend.new(user_friend: params[:request_id], user_id: @user.id)
          friend_request.save!
          status 200

        end

        desc 'accept request'
        params do
          requires :request_id
        end
        put  do
          @friend = @user.friends.find_by(user_friend: params[:request_id])
          error!("request not found", :not_found) if @friend.nil?

          @friend.status = "accepted"
          @friend.save
          status 200
        end


      end

    end
  end
end
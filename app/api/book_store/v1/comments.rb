module BookStore
  module V1

    class Comments < Base
      version 'v1', using: :path
      format :json
      prefix :comment


      resource :comments do

        desc 'get all comments'
        params do
          requires :post_id
        end
        get do
          comments = Comment.all.where(post_id: params[:post_id]).order(created_at: :desc)
          present comments
        end


        desc 'create a comment'
        params do
          requires :comment, type:String
          requires :post_id, type:Integer
          # requires :user_id, type:Integer
        end
        post do
          comment = Comment.new(comment: params[:comment], post_id: params[:post_id], user_id: @user.id)
          comment.save!

          present comment
        end

        route_param :id do

          desc 'show a specific comment'
          get do
            comment = Comment.find_by(id: params[:id])
            error!("comment not found", :not_found) if comment.nil?

            present comment
          end

          desc "delete any comment comment author or post author can delete comment"
          delete do
            comment = Comment.find_by(id: params[:id])
            error!("comment not found", :not_found) if comment.nil?

            if comment.user_id == @user.id || comment.post.user_id == @user.id
              comment.destroy!
              status 200

            else
              error!("UnAuthorized", 401)
            end

          end

        end

      end


    end

  end
end
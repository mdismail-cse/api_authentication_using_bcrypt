module BookStore
  module V1
    class Posts < Base
      version 'v1', using: :path
      format :json
      prefix :post

      resource :posts do

        desc 'get all Post'
        get do
          post = Post.all.order(user_id: :asc)
          present post
        end

        desc 'get only current user post'
        get 'mypost' do
          post = @user.posts
          present post
        end

        desc 'create a post with current user'
        params do
          requires :title, type:String
          requires :description, type: String
        end
        post do
          post = Post.new(title: params[:title], description: params[:description], user_id: @user.id)
          post.save!
          present post, with: BookStore::Entities::PostCreate

        rescue StandardError => error
          error!("#{error.message}")
        end

        desc 'find a specific post'
        params do
          requires :post_id
        end
        post 'view' do
          post = Post.find_by(id: params[:post_id])
          error!('not found', 401 ) if post.nil?

          present post, with:BookStore::Entities::SinglePost
          rescue StandardError => error
            error!("#{error.message}", :not_found)
        end

        desc 'update post'
        params do
          requires :post_id
          requires :title, type:String
          requires :description, type:String
        end
        put do
          post = Post.find_by(id: params[:post_id])
          error!('not found', :not_found) if post.nil?
          post.update!(title: params[:title], description: params[:description])

          present post
          rescue StandardError => error
            error!("#{error.message}", :not_found)
        end

        desc 'delete a post'
        params do
          requires :post_id
        end
        delete do
          post = Post.find(params[:post_id])
          error!('not found', :not_found) if post.nil?
          post.destroy
          status 200
          rescue StandardError => error
           error!("#{error.message}", :not_found)
        end

      end


    end
  end
end
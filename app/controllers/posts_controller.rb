class PostsController < ActionController::Base
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @destinations = Destination.all
        @bloggers = Blogger.all
    end

    def create
        if params[:post][:title] != ""
            if params[:post][:content].length > 100
                Post.create(permitted_params[:post])
                redirect_to(posts_path)
            end
        end
    end

    def permitted_params
        params.permit({
            post: [
                :title,
                :content,
                :blogger_id,
                :destination_id
            ]
        })
    end

    def update
        post = Post.find(params[:id])
        new_likes = post.likes += 1
        post.update(likes: new_likes)
        redirect_to(post_path(params[:id]))
    end
end
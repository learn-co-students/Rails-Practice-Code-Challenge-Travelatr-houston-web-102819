class BloggersController < ActionController::Base
    def index
        @bloggers = Blogger.all
    end

    def new
        @posts = Post.all
    end

    def create
        if !(Blogger.find_by({name: permitted_params[:blogger][:name]}))
            if (permitted_params[:blogger][:age].to_i > 0)
                if (permitted_params[:blogger][:bio].length >= 30)

                    Blogger.create(permitted_params[:blogger])
                    redirect_to(bloggers_path)
                    
                end
            end
        end
        
        
    end

    def show
        @blogger = Blogger.find(params[:id])

        @likes = 0
        @blogger.posts.each do |post|
            @likes += post.likes
        end

        most_likes = 0
        @blogger.posts.each do |post|
            if post.likes > most_likes
                most_likes = post.likes
                @blog_with_most_likes = post.title
            end
        end
    end

    def permitted_params
        params.permit({
            blogger: [
                :name,
                :bio,
                :age,
            ]
        })
    end
end
class DestinationsController < ActionController::Base
    def index
        @destinations = Destination.all
    end

    def show
        @destination = Destination.find(params[:id])

        @last_5_posts = @destination.posts.last(5)

        likes = 0
        @destination.posts.each do |post|
            if post.likes > likes
                likes = post.likes
                @post_with_most_likes = post
            end
        end

        total_age = 0
        @destination.bloggers.each do |blogger|
            total_age += blogger.age
        end
        @avg_age = total_age / @destination.bloggers.length
    end
end
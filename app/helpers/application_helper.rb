module ApplicationHelper

    def owner?(object)
        current_user == object.user
    end

    def private?(object)
        object.status == "private"
    end

    def top_users
        if User.most_posts.empty?
            'No Users Yet. Start creating posts to top the list!'
        else
            User.most_posts.limit(10)
        end
    end

    def top_posts
        if Post.most_comments.empty?
            'No comments posts yet. Start commenting!'
        else
            Post.most_comments.limit(10)
        end
    end

    def top_artists
        if Artist.most_photocards.empty?
            'No artists with photocards yet. Start adding photocards to artists now!'
        else
            Artist.most_photocards.limit(10)
        end
    end

    def include_artist_path
        request.path.include?("artists")
    end

    def include_post_path
        request.path.include?("posts")
    end

    def include_user_path
       if request.path.include?("users")
            uuid = params[:user_id]
       end
    end

    def obj_public?(object)
        object.status == "public"
    end

end

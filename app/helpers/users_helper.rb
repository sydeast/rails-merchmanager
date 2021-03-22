module UsersHelper

    def user_post_links
        if @user.posts.most_comments.empty?
            tag.p(link_to('No posts yet - write a post here', new_user_post_path(current_user)))
        else
            tag.p(link_to('Create another post', new_user_post_path(current_user)))
        end
    end

    def user_photocard_links
        if @user.photocards.empty?
            tag.p(link_to('No photocards yet - create a photocard here', new_user_photocard_path(current_user)))
        else
             tag.p(link_to('Create more photocards', new_user_photocard_path(current_user)))
        end
    end

    def user_artist_links
        if @user.artists.empty?
            tag.p(link_to('No artists yet - create a artist here', new_user_artist_path(current_user)))
        else
            tag.p(link_to('Create more artists', new_user_artist_path(current_user)))
        end
    end
end

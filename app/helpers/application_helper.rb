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

end

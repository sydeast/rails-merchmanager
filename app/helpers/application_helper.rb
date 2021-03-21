module ApplicationHelper

    def owner?(object)
        current_user == object.user
    end

    def private?(object)
        object.status == "private"
    end



end

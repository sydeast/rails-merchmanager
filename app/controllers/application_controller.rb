class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    private
    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!session[:user_id]
        #if having issues check the !!current_user this was not included in the original work thru
    end

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end

    
end

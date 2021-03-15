class SessionsController < ApplicationController

    def destroy
        session.clear
        redirect_to root_path
    end


    def create
       user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
            #also could the redirect go to '/users/#{user.id}'
        else
            flash[:message] = 'Oops! Your email or password is incorrect. Please check the information and try again.'
            redirect_to '/login'
        end
    end
end
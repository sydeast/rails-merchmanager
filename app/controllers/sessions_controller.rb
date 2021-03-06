class SessionsController < ApplicationController



    def destroy
        session.clear
        redirect_to root_path
    end


    def create
       user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to root_path
            #also could the redirect go to '/users/#{user.id}'
        else
            flash[:message] = 'Oops! Your email or password is incorrect. Please check the information and try again.'
            redirect_to '/login'
        end
    end

    def omniauth
        user = User.from_omniauth(auth)
        if user.valid?
            session[:user_id] = user.id
            redirect_to root_path
        else
            flash[:message] = "Oops! An error occurred during login. Please try again."
            redirect_to login_path
        end
    end

    private
    def auth
        request.env['omniauth.auth']
    end
end
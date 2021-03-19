class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            #log them in
            session[:user_id] = @user.id
            #redirect to the show page
            redirect_to @user
        else
            render :new
        end

    end

    def show
        redirect_if_not_logged_in
        @user = User.find_by(id: params[:id])
        redirect '/' if !@user
    end

    def destroy
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        @user.artists.each do |a|
            a.delete
        end
        @user.photocards.each do |p|
            p.delete
        end
        @user.destroy
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end

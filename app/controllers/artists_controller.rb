class ArtistsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @artist = Artist.new
    end

    def create
        @artist = current_user.artists.build(artist_params)
        @artist.age = ((Time.zone.now - @artist.birth_date.to_time) / 1.year.seconds).floor
        if @artist.save
            redirect_to artists_path
        else
            render :new
        end
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id]) # then its nested
            @artists = @user.artists
        else
            @error = "Oops. An error occurred. You are now seeing all artists." if params[:user_id]
            @artists = Artist.all
        end
    end


    def show
        @artist = Artist.find_by_id(params[:id])
        redirect_to artists_path if !@artist
    end


    private
    def artist_params
        params.require(:artist).permit(:name, :birth_date, :other_name, :age, :position, :company, :artist_notes)
    end
end

class ArtistsController < ApplicationController
    before_action :redirect_if_not_logged_in
    # before_action :redirect_if_not_artist_owner, only: [:edit, :update]

    def index
        if session[:user_id] && current_user
            @artists = current_user.artists.order(:name)
        else
            @error = "Oops, you don't have any photocards yet. Please click the link above to create some now."
            @artists = Artist.all
        end
    end


    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @artist = @user.artists.build
        else
            @artist = Artist.new
        end
        @artist.build_album
    end

    def create
        @artist = current_user.artists.build(artist_params)
        @artist.age = ((Time.zone.now - @artist.birth_date.to_time) / 1.year.seconds).floor
        # ^^creates an age based off DOB and rounds down to the nearest year`
        if @artist.save
            redirect_to artist_path(@artist)
        else
            render :new
        end
    end

    def show
        @artist = Artist.find_by_id(params[:id])
        redirect_to artists_path if !@artist
    end

    def edit
        @artist = Artist.find_by_id(params[:id])
        redirect_to artists_path if !@artist || @artist.user != current_user
    end

    def update
        @artist = Artist.find_by_id(params[:id])
        redirect_to artists_path if !@artist || @artist.user != current_user
        if @artist.update(artist_params)
            redirect_to artist_path(@artist)
        else
            render :edit
        end
    end


    def destroy
        @artist = Artist.find_by_id(params[:id])
        @artist.destroy
        redirect_to artists_path
    end


    private
    def artist_params
        params.require(:artist).permit(:name, :birth_date, :other_name, :age, :position, :company, :artist_notes, :album_id, :status,album_attributes: [:title, :release_date])
    end

    # def redirect_if_not_artist_owner
    #     redirect_to artists_path if @artist.user != current_user
    # end
end

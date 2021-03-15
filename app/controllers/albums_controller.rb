class AlbumsController < ApplicationController

    def index
        @albums = Album.all.includes(:artists)
    end

    def show
        @album = Album.find_by_id(params[:id])
    end
end

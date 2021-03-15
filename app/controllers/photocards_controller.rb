class PhotocardsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:user_id] && current_user
            @photocards = @user.photocards
        else
            flash[:message] = "Oops. An error occurred. You are routed back to your page." if params[:user_id]
            @photocards = Photocard.all
        end
    end

    def new
        if params[:artist_id] && @artist = Artist.find_by_id(params[:artist_id])
            @photocard = @artist.photocards.build
        else
            @error = "Oops, we could not find that artist." if params[:artist_id]
            @photocard = Photocard.new
        end
    end

    def create
        @photocard = current_user.photocards.build(photocard_params)
        if @photocard.save
            redirect_to photocard_path(@photocard)
        else
            render :new
        end
    end

    def show
        @photocard = Photocard.find_by_id(params[:id])
        redirect_to photocards_path if !@photocard
    end

    def edit
        @photocard = Photocard.find_by_id(params[:id])
        redirect_to photocards_path if !@photocard
    end

    def update
        @photocard = Photocard.find_by_id(params[:id])
        redirect_to photocards_path if !@photocard
        if @photocard.update(photocard_params)
            redirect_to photocard_path(@photocard)
        else
            render :edit
        end
    end


    def destroy
        @photocard = Photocard.find_by_id(params[:id])
        @photocard.destroy
        redirect_to photocards_path
    end


    private

    def photocard_params
        params.require(:photocard).permit(:title, :print_type, :source_name, :source_type, :card_setnum, :card_num, :card_type, :card_notes, :artist_id)
    end


end

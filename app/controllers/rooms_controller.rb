class RoomsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @musics = Music.all.includes([:image_attachment]).order("prefecture_id ASC")
  end

  def show
    @music = Music.find(params[:id])
    @genres = @music.genres
  end

  def edit
    @music = Music.find(params[:id])
  end


  private

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
end

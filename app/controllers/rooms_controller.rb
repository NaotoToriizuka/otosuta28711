class RoomsController < ApplicationController
  def index
    @musics = Music.all.includes([:image_attachment])
  end

  def show
    @music = Music.find(params[:id])
    @genres = @music.genres
  end

  def edit
    @music = Music.find(params[:id])
    @genre = Genre.all
  end

end

class RoomsController < ApplicationController
  def index
    @musics = Music.all
  end

  def show
    @music = Music.find(params[:id])
  end

  def edit
    @music = Music.find(params[:id])
  end
end

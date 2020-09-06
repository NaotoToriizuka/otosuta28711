class MusicsController < ApplicationController

  def index
  end

  def new
    @music = Music.new
  end

  def create
    @music = Music.create 

    if @music.valid?
      @music.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def music_params
    params.require(:music).permit(:name, :content, :genre_id, :representative, :mail, :prefecture_id, :post_code, :city, :house_number, :building_name, :phone_number, :station, :walk, :hour, :holiday, :fee, :url, :remarks).merge(:user_id: current_user.id)
  end
end

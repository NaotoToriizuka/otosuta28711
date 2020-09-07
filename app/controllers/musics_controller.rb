class MusicsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    @music = Music.all
  end

  def new
    @music = Music.new
  end

  def create
    @music = Music.create(music_params)
    if @music.valid?
      @music.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def music_params
    params.require(:music).permit(:image, :name, :content, :genre_id1, :genre_id2, :genre_id3, :representative, :mail, :prefecture_id, :post_code, :city, :house_number, :building_name, :phone_number, :station, :walk, :hour, :holiday, :fee, :url, :remarks).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end

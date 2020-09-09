class MusicsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :room]
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
      render :new
    end

    # def room
    #   @musics = Music.where(name)
    # end
  end

  def show
    @music = Music.find(params[:id])
  end

  def update
    @music = Music.find(params[:id])
    @music.update(music_params)
    if @music.valid?
      @music.update(music_params)
      redirect_to root_path
    else
      render template: "rooms/edit"
    end
  end

  private

  def music_params
    params.require(:music).permit(:image, :name, :content, :genre1_id, :genre2_id, :genre3_id, :representative, :mail, :prefecture_id, :post_code, :city, :house_number, :building_name, :phone_number, :station, :walk, :hour, :holiday, :fee, :url, :remarks).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end

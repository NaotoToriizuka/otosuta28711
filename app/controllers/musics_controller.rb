class MusicsController < ApplicationController
  before_action :move_to_sign_in, except: [:index, :room, :search]

  def index
    @q = Music.ransack(params[:q])
    @musics = @q.result(distinct: true)
    @prefecture = Prefecture.where.not id: 0
    @genre = Genre.all
  end

  def search
    @q = Music.search(search_params)
    @musics = @q.result(distinct: true).includes([:image_attachment]).order("prefecture_id ASC")
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

  def destroy
    music = Music.find(params[:id])
    if music.valid?
      music.destroy
      redirect_to root_path
    else
      render template: "rooms/show"
    end
  end

  private

  def music_params
    params.require(:music).permit(:image, :name, :content, :genre1_id, :genre2_id, :genre3_id, :representative, :mail, :prefecture_id, :post_code, :city, :house_number, :building_name, :phone_number, :station, :walk, :hour, :holiday, :fee, :url, :remarks, genre_ids: []).merge(user_id: current_user.id)
  end
  
  def search_params
    params.require(:q).permit!
  end

  def move_to_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end

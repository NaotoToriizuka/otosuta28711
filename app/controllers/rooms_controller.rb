class RoomsController < ApplicationController
  def index
    @musics = Music.all
  end
end

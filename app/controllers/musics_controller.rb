class MusicsController < ApplicationController

  def index
  end

  def new
    @music = Music.new
  end

  def create
    @item = Music.create 
  end
end

class MusicsController < ApplicationController

  def index
  end

  def new
    @music = Music.new
  end

  def create
    @music = Music.create 
  end
end

class ListsController < ApplicationController
  def index
    @music = Music.all
  end
end

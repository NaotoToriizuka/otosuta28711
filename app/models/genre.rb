class Genre < ApplicationRecord
  has_many :music_genres
  has_many :musics, through: :music_genres, dependent: :destroy

  validates :name, presence: true 
end

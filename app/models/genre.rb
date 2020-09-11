class Genre < ApplicationRecord
  has_many :music_genres
  has_many :musics, through: :music_genres
end

class MusicGenre < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :music
  belongs_to_active_hash :genre
end

class CreateMusicGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :music_genres do |t|
      t.references :music, foreign_key: true
      t.references :genre, foreign_key: true
      t.timestamps
    end
  end
end

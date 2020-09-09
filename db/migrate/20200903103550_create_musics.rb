class CreateMusics < ActiveRecord::Migration[6.0]
  def change
    create_table :musics do |t|
      t.references    :user,            null: false, foreign_key: true
      t.string        :name,            null: false
      t.text          :content
      t.integer       :genre1_id,       null: false
      t.integer       :genre2_id
      t.integer       :genre3_id
      t.string        :representative,  null: false
      t.string        :mail,            null: false, unique: true
      t.integer       :prefecture_id,   null: false
      t.string        :post_code,       null: false
      t.string        :city,            null: false
      t.string        :house_number,    null: false
      t.string        :building_name
      t.string        :phone_number,    null: false
      t.string        :station,         null: false
      t.integer       :walk,            null: false
      t.string        :hour
      t.string        :holiday
      t.text          :fee,             null: false
      t.text          :url
      t.text          :remarks
      t.timestamps
    end
  end
end

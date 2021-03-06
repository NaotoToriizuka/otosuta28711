class Music < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :music_genres
  has_many :genres, through: :music_genres ,dependent: :destroy
  belongs_to_active_hash :prefecture
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :representative
    validates :mail, format: {with: /\A\S+@\S+\.\S+\z/, message: ""}
    validates :prefecture_id, numericality: {other_than: 0, message: "Select"}
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
    validates :city
    validates :house_number
    validates :phone_number, numericality: { with: /\A\d{10}$|^\d{11}\z/, message: "Input correctly"}
    validates :station
    validates :walk, numericality: {with: /\A[0-9０-９]+\z/, message: "Full-width or half-width numbers"}
    validates :fee
  end
  validates :mail, uniqueness: true
end

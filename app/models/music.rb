class Music < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :genre
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :name
    validates :genre_id, numericality: {other_than: 1, message: "Select"}
    validates :representative
    validates :mail, format: {with: /\A\S+@\S+\.\S+\z/, message: ""}
    validates :prefecture_id, numericality: {other_than: 1, message: "Select"}
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
    validates :city
    validates :house_number
    validates :phone_number, numericality: { with: /\A\d{10}$|^\d{11}\z/, message: "Input correctly"}
    validates :station
    validates :walk, numericality: {with: /\A[0-9０-９]+\z/, message: ""}
    validates :fee, numericality: {with: /\A[0-9]+\z/, message: "Half-width number"}
  end
end

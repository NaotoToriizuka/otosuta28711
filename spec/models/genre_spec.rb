require 'rails_helper'

RSpec.describe Genre, type: :model do
  before do
    @genre = FactoryBot.build(:genre)
  end

  describe '教室登録' do
    context '教室の情報が保存できるとき' do
      it 'genreが選択されていれば保存できる' do
        binding.pry
        expect(@genre).to be_valid
      end
    end
    context '教室の情報が保存できないとき' do
      it 'genreテーブルのnameが選択しなければと保存できない' do
        @genre.name = nil
        @genre.valid?
        expect(@genre.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
end

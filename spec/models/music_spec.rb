require 'rails_helper'

RSpec.describe Music, type: :model do
  before do
    @music = FactoryBot.build(:music)
  end

  describe '教室登録' do
    context '教室の情報が保存できるとき' do
      it 'content、genre_id2、genre_id3、building_name、hour、holiday、url、remarks以外の値が存在すれば登録できる' do
      end
    end

    context '教室の情報が保存できないとき' do
      it 'nameが空では保存できない' do
      end
      it 'genre_id1の値が0(選択してください)では保存できない' do
      end
      it 'post_codeが空では保存できない' do
      end
      it 'post_codeにはハイフンがないと保存できない' do
      end
      it 'prefectureを選択しなければ保存できない' do
      end
      it 'prefectureの値が0(---)が選択されたら保存できない' do
      end
      it 'cityが空では保存できない' do
      end
      it 'house_numberが空では保存できない' do
      end
      it 'stationが空では保存できない' do
      end
      it 'walkが空では保存できない' do
      end
      it 'walkは半角数字か全角数字でないと保存できない' do
      end
      it 'phone_numberが空では保存できない' do
      end
      it 'phone_numberでハイフンがあると保存できない' do
      end
      it 'mailが空だと保存できない' do
      end
      it '重複したmailが存在する場合登録できない' do
      end
      it 'representativeが空では保存できない' do
      end
      it 'feeが空では保存できない' do
      end
    end
  end
end

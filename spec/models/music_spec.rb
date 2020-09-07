require 'rails_helper'

RSpec.describe Music, type: :model do
  before do
    @music = FactoryBot.build(:music)
    @music.image = fixture_file_upload('public/top_image.jpg')
  end

  describe '教室登録' do
    context '教室の情報が保存できるとき' do
      it 'content、genre_id2、genre_id3、building_name、hour、holiday、url、remarks以外の値が存在すれば登録できる' do
        @music.content = nil
        @music.genre_id2 = nil
        @music.genre_id3 = nil
        @music.building_name = nil
        @music.hour = nil
        @music.holiday = nil
        @music.url = nil
        @music.remarks = nil
        @music.valid?
        expect(@music).to be_valid
      end
    end

    context '教室の情報が保存できないとき' do
      it 'nameが空では保存できない' do
        @music.name = nil
        @music.valid?
        expect(@music.errors.full_messages).to include("Name can't be blank")
      end
      it 'genre_id1の値が0(選択してください)では保存できない' do
        @music.genre_id1 = 0
        @music.valid?
        expect(@music.errors.full_messages).to include("Genre id1 Select")
      end
      it 'post_codeが空では保存できない' do
        @music.post_code = nil
        @music.valid?
        expect(@music.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeにはハイフンがないと保存できない' do
        @music.post_code = 1234567
        @music.valid?
        expect(@music.errors.full_messages).to include("Post code Input correctly")
      end
      it 'prefectureを選択しなければ保存できない' do
        @music.prefecture_id = nil
        @music.valid?
        expect(@music.errors.full_messages).to include("Prefecture Select")
      end
      it 'prefectureの値が0(---)が選択されたら保存できない' do
        @music.prefecture_id = 0
        @music.valid?
        expect(@music.errors.full_messages).to include("Prefecture Select")
      end
      it 'cityが空では保存できない' do
        @music.city = nil
        @music.valid?
        expect(@music.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では保存できない' do
        @music.house_number = nil
        @music.valid?
        expect(@music.errors.full_messages).to include("House number can't be blank")
      end
      it 'stationが空では保存できない' do
        @music.station = nil
        @music.valid?
        expect(@music.errors.full_messages).to include("Station can't be blank")
      end
      it 'walkが空では保存できない' do
        @music.walk = nil
        @music.valid?
        expect(@music.errors.full_messages).to include("Walk can't be blank")
      end
      it 'walkは半角数字か全角数字でないと保存できない' do
        @music.walk = '一'
        @music.valid?
        expect(@music.errors.full_messages).to include("Walk Full-width or half-width numbers")
      end
      it 'phone_numberが空では保存できない' do
        @music.phone_number = nil
        @music.valid?
        expect(@music.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberでハイフンがあると保存できない' do
        @music.phone_number = '000-0000-0000'
        @music.valid?
        expect(@music.errors.full_messages).to include("Phone number Input correctly")
      end
      it 'mailが空だと保存できない' do
        @music.mail = nil
        @music.valid?
        expect(@music.errors.full_messages).to include("Mail can't be blank")
      end
      it '重複したmailが存在する場合登録できない' do
        @music.save
        another_music = FactoryBot.build(:music)
        another_music.mail = @music.mail
        another_music.valid?
        expect(another_music.errors.full_messages).to include("Mail has already been taken")
      end
      it 'representativeが空では保存できない' do
        @music.representative = nil
        @music.valid?
        expect(@music.errors.full_messages).to include("Representative can't be blank")
      end
      it 'feeが空では保存できない' do
        @music.fee = nil
        @music.valid?
        expect(@music.errors.full_messages).to include("Fee can't be blank")
      end
    end
  end
end

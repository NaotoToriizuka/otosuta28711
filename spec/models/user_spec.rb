require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
      end
      it "nicknameが6文字以下で登録できる" do
      end
      it "passwordが6文字以上の半角英数字で登録できる"do
      end
    end

    context '新規が登録がうまくいかないとき' do
      it "nicknameが空では登録できない" do
      end
      it "nicknameが7文字以上だと登録できない" do
      end
      it "emailが空では登録できない" do
      end
      it "重複したemailが存在する場合は登録できない" do
      end
      it "passwordが空では登録できない" do
      end
      it "passwordが5文字以下では登録できない" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do 
      end
    end
  end
end

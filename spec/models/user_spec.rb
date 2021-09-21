require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '各情報が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it '名字が全角ひらがなでは登録できる' do
        @user.family_name = 'あああ'
        expect(@user).to be_valid
      end
      it '名前が全角ひらがなでは登録できる' do
        @user.given_name = 'あああ'
        expect(@user).to be_valid
      end
      it '名字が全角カタカナでは登録できる' do
        @user.family_name = 'アアア'
        expect(@user).to be_valid
      end
      it '名前が全角カタカナでは登録できる' do
        @user.given_name = 'アアア'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailが＠を含まない場合登録できない' do
        @user.email = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'test111'
        @user.password_confirmation = 'test222'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = 'test1'
        @user.password_confirmation = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字のみであればと登録できないこと' do
        @user.password = '1234567'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it 'passwordが半角英のみであればと登録できないこと' do
        @user.password = 'abcdefg'
        @user.password_confirmation = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it '名字が空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it '名前が空では登録できない' do
        @user.given_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name can't be blank")
      end
      it '名字が半角英では登録できない' do
        @user.family_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.")
      end
      it '名前が半角英では登録できない' do
        @user.given_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name is invalid. Input full-width characters.")
      end
      it '名字カナが空では登録できない' do
        @user.family_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading can't be blank")
      end
      it '名前カナが空では登録できない' do
        @user.given_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name reading can't be blank")
      end
      it '名字カナが漢字では登録できない' do
        @user.family_name_reading = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading is invalid. Input full-width katakana characters.")
      end
      it '名前カナが漢字では登録できない' do
        @user.given_name_reading = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name reading is invalid. Input full-width katakana characters.")
      end
      it '名字カナがひらがなでは登録できない' do
        @user.family_name_reading = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading is invalid. Input full-width katakana characters.")
      end
      it '名前カナがひらがなでは登録できない' do
        @user.given_name_reading = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name reading is invalid. Input full-width katakana characters.")
      end
      it '名字カナが半角英では登録できない' do
        @user.family_name_reading = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading is invalid. Input full-width katakana characters.")
      end
      it '名前カナが半角英では登録できない' do
        @user.given_name_reading = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name reading is invalid. Input full-width katakana characters.")
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
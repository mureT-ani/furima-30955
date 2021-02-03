require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '登録できる場合' do
      it 'ニックネーム、メールアドレス、パスワード、パスワード（確認用）、ユーザー本名、ユーザー本名のフリガナ、生年月日が存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end
    context '登録できない場合' do
      it 'ニックネームが存在しないと登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが存在しないと登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスに＠がないと登録できないこと' do
        @user.email = 'emailaddress'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'すでに登録されているメールアドレスでは登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'パスワードが存在しないと登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが５文字以下だと登録できないこと' do
        @user.password = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードが半角英数字混合でないと登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードが英語のみでは登録できないこと' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードが全角では登録できないこと' do
        @user.password = 'あいうえおか'
        @user.password_confirmation = 'あいうえおか'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワード（確認用）がパスワードと一致しないと登録できないこと' do
        @user.password = '12345a'
        @user.password_confirmation = '12345b'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザー本名の名字が存在しないと登録できないこと' do
        @user.family_name_kanji = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanji can't be blank")
      end
      it 'ユーザー本名の名前が存在しないと登録できないこと' do
        @user.first_name_kanji = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end
      it 'ユーザー本名の名字が全角でないと登録できないこと' do
        @user.family_name_kanji = 'John'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kanji is invalid')
      end
      it 'ユーザー本名の名前が全角でないと登録できないこと' do
        @user.first_name_kanji = 'Michael'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanji is invalid')
      end
      it 'ユーザー本名の名字のフリガナが存在しないと登録できないこと' do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'ユーザー本名の名前のフリガナが存在しないと登録できないこと' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'ユーザー本名の名字のフリガナが全角（カタカナ）でないと登録できないこと' do
        @user.family_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end
      it 'ユーザー本名の名前のフリガナが全角（カタカナ）でないと登録できないこと' do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it '生年月日が存在しないと登録できないこと' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

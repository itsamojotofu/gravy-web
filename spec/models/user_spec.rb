# frozen_string_literal: true

require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全てのカラムが正しいフォーマットで存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは一意性がないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含んでいないと登録できない' do
        @user.email = 'ssssssss'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが５文字以下だと登録できない' do
        @user.password = 'ssss1'
        @user.password_confirmation = 'ssss1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字混合でないと登録できない(英字のみ)' do
        @user.password = 'ssssss'
        @user.password_confirmation = 'ssssss'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must include alphabet and numbers')
      end
      it 'passwordが半角英数字混合でないと登録できない(数字のみ)' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must include alphabet and numbers')
      end
      it 'passwordは確認用を含めて2回入力されないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードとパスワード（確認用)の値が一致しないとと登録できない' do
        @user.password = 'sample1'
        @user.password_confirmation = 'sample2'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '郵便番号が空だと登録できない' do
        @user.zip_code = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Zip code can't be blank",
                                                      'Zip code needs to be filled in like 000-0000')
      end
      it '郵便番号がハイフンを含んでいないと購入できない' do
        @user.zip_code = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Zip code needs to be filled in like 000-0000')
      end
      it '都道府県が空だと登録できない' do
        @user.prefecture_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '地域が空だと登録できない' do
        @user.district = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("District can't be blank")
      end
      it '番地が空だと登録できない' do
        @user.street = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Street can't be blank")
      end
      it '電話番号が空だと登録できない' do
        @user.phone_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下だと登録できない' do
        @user.phone_number = '123456789'
        @user.valid?
        expect(@user.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上だと登録できない' do
        @user.phone_number = '123456789012'
        @user.valid?
        expect(@user.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end

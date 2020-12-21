# frozen_string_literal: true

require 'rails_helper'

describe Chef do
  before do
    @chef = FactoryBot.build(:chef)
  end

  describe 'シェフ新規登録' do
    context '新規登録がうまくいくとき' do
      it '全てのカラムが正しいフォーマットで存在すれば登録できる' do
        expect(@chef).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @chef.name = ''
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空だと登録できない' do
        @chef.email = ''
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは一意性がないと登録できない' do
        @chef.save
        another_chef = FactoryBot.build(:chef)
        another_chef.email = @chef.email
        another_chef.valid?
        expect(another_chef.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含んでいないと登録できない' do
        @chef.email = 'ssssssss'
        @chef.valid?
        expect(@chef.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空だと登録できない' do
        @chef.password = ''
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが５文字以下だと登録できない' do
        @chef.password = 'ssss1'
        @chef.password_confirmation = 'ssss1'
        @chef.valid?
        expect(@chef.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字混合でないと登録できない(英字のみ)' do
        @chef.password = 'ssssss'
        @chef.password_confirmation = 'ssssss'
        @chef.valid?
        expect(@chef.errors.full_messages).to include('Password must include alphabet and numbers')
      end
      it 'passwordが半角英数字混合でないと登録できない(数字のみ)' do
        @chef.password = '111111'
        @chef.password_confirmation = '111111'
        @chef.valid?
        expect(@chef.errors.full_messages).to include('Password must include alphabet and numbers')
      end
      it 'passwordは確認用を含めて2回入力されないと登録できない' do
        @chef.password_confirmation = ''
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードとパスワード（確認用)の値が一致しないとと登録できない' do
        @chef.password = 'sample1'
        @chef.password_confirmation = 'sample2'
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '郵便番号が空だと登録できない' do
        @chef.zip_code = ''
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Zip code can't be blank",
                                                      'Zip code needs to be filled in like 000-0000')
      end
      it '郵便番号がハイフンを含んでいないと購入できない' do
        @chef.zip_code = '1234567'
        @chef.valid?
        expect(@chef.errors.full_messages).to include('Zip code needs to be filled in like 000-0000')
      end
      it '都道府県が空だと登録できない' do
        @chef.prefecture_id = 1
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '地域が空だと登録できない' do
        @chef.district = ''
        @chef.valid?
        expect(@chef.errors.full_messages).to include("District can't be blank")
      end
      it '番地が空だと登録できない' do
        @chef.street = ''
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Street can't be blank")
      end
      it '電話番号が空だと登録できない' do
        @chef.phone_number = ''
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下だと登録できない' do
        @chef.phone_number = '123456789'
        @chef.valid?
        expect(@chef.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上だと登録できない' do
        @chef.phone_number = '123456789012'
        @chef.valid?
        expect(@chef.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end

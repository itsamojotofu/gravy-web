# frozen_string_literal: true

require 'rails_helper'

describe Dish do
  before do
    @dish = FactoryBot.build(:dish)
  end

  describe '料理出品登録' do
    context '出品がうまくいくとき' do
      it '全てのカラムが正しいフォーマットで存在すれば出品できる' do
        expect(@dish).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it '画像が空だと出品できない' do
        @dish.image = nil
        @dish.valid?
        expect(@dish.errors.full_messages).to include("Image can't be blank")
      end
      it '料理名が空だと出品できない' do
        @dish.name = ''
        @dish.valid?
        expect(@dish.errors.full_messages).to include("Name can't be blank")
      end
      it '料理のジャンルが空だと出品できない' do
        @dish.genre_id = 1
        @dish.valid?
        expect(@dish.errors.full_messages).to include("Genre can't be blank")
      end
      it '調理時間が空だと出品できない' do
        @dish.ready_id = 1
        @dish.valid?
        expect(@dish.errors.full_messages).to include("Ready can't be blank")
      end
      it '商品の価格が空だと出品できない' do
        @dish.price = ''
        @dish.valid?
        expect(@dish.errors.full_messages).to include("Price can't be blank")
      end
      it '商品の価格が¥100~999999の間でないと出品できない' do
        @dish.price = 99
        @dish.valid?
        expect(@dish.errors.full_messages).to include('Price should be within ¥100~¥999,999')
      end
      it '商品の価格が¥100~999999の間でないと出品できない' do
        @dish.price = 1_000_000
        @dish.valid?
        expect(@dish.errors.full_messages).to include('Price should be within ¥100~¥999,999')
      end
      it '商品の価格が半角数字でないと出品できない' do
        @dish.price = '３００'
        @dish.valid?
        expect(@dish.errors.full_messages).to include('Price should be half-width numbers')
      end
    end
  end
end

require 'rails_helper'

describe Profile do
  before do
    @profile = FactoryBot.build(:profile)
  end

  describe 'プロファイル新規登録' do
    context '新規登録がうまくいくとき' do
      it '全てのカラムが正しいフォーマットで存在すれば登録できる' do
        expect(@profile).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'business_hour_beginが空だと登録できない' do
        @profile.business_hour_begin = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Business hour begin can't be blank")
      end
      it 'business_hour_endが空だと登録できない' do
        @profile.business_hour_end = ''
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Business hour end can't be blank")
      end
      it '現在の状態が空だと登録できない' do
        @profile.status_id = 1
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Status can't be blank")
      end
      it '性別が空だと登録できない' do
        @profile.gender_id = 1
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Gender can't be blank")
      end
      it '年代が空だと登録できない' do
        @profile.age_id = 1
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Age can't be blank")
      end
      it '得意なジャンルが空だと登録できない' do
        @profile.genre_id = 1
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Genre can't be blank")
      end
    end
  end
end
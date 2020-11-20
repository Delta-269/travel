require 'rails_helper'

RSpec.describe Spot, type: :model do
  before do
    @spot = FactoryBot.build(:spot)
  end

  describe '新規投稿' do
    context '新規投稿がうまくいくとき' do
      it '全項目が存在すれば投稿できる' do
        expect(@spot).to be_valid
      end
    end
    context '新規投稿がうまくいかないとき' do
      it '画像が存在しなければ投稿できない' do
        @spot.image = nil
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Image can't be blank")
      end
      it 'タイトルが空だと投稿できない' do
        @spot.title = ""
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Title can't be blank")
      end
      it 'カテゴリーが選択されてなければ投稿できない' do
        @spot.category_id = 1
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Category must be other than 1")
      end
      it '都道府県が選択されてなければ投稿できない' do
        @spot.area_id = 1
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Area must be other than 1")
      end
      it '市区町村等に記述がない場合投稿できない' do
        @spot.address = nil
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Address can't be blank")
      end
      it 'コメントが空だとt投稿できない' do
        @spot.text = nil
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end
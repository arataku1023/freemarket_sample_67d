require 'rails_helper'

describe Item do
  describe '#create' do

    #nameが空の場合保存できない
    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    #detail
    it "is invalid without a detail" do
      item = build(:item, detail: "")
      item.valid?
      expect(item.errors[:detail]).to include("を入力してください")
    end

    #price
    it "is invalid without a price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    #status
    it "is invalid without a status" do
      item = build(:item, status: "")
      item.valid?
      expect(item.errors[:status]).to include("を入力してください")
    end

    #mail
    it "is invalid without a mail" do
      item = build(:item, mail: "")
      item.valid?
      expect(item.errors[:mail]).to include("を入力してください")
    end

    #mail_way
    it "is invalid without a mail_way" do
      item = build(:item, mail_way: "")
      item.valid?
      expect(item.errors[:mail_way]).to include("を入力してください")
    end

    #user_id
    it "is invalid without a user_id" do
      item = build(:item, user_id: "")
      item.valid?
      expect(item.errors[:user_id]).to include("を入力してください")
    end

    #category_idが空の場合保存できない
    it "is invalid without a category_id" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    #arrival_date_id
    it "is invalid without a arrival_date_id" do
      item = build(:item, arrival_date_id: "")
      item.valid?
      expect(item.errors[:arrival_date_id]).to include("を入力してください")
    end

    #prefecture_id
    it "is invalid without a prefecture_id" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    #nameの文字が40文字以上場合
    it "is invalid name is too long maximum 40 characters" do
      item = build(:item, name: "a" * 41)
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end

    #priceが9999999円以上の場合
    it "is invalid price is too much maximum 9999999" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("は一覧にありません")
    end

    #priceが300円以下の場合
    it "is invalid with a that has less than 300" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("は一覧にありません")
    end





    
  end
end

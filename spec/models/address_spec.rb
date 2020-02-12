require 'rails_helper'

describe Address do
  describe '#create' do
    #post_codeが空では登録できないこと
    it "is invalid without a post_code" do
      address = build(:address, post_code: nil)
      address.valid?
      expect(address.errors[:post_code]).to include("を入力してください")
    end

    #prefecture
    it "is invalid without a prefecture" do
      address = build(:address, prefecture: nil)
      address.valid?
      expect(address.errors[:prefecture]).to include("を入力してください")
    end

    #town
    it "is invalid without a town" do
      address = build(:address, town: nil)
      address.valid?
      expect(address.errors[:town]).to include("を入力してください")
    end

    #address_num
    it "is invalid without a address_num" do
      address = build(:address, address_num: nil)
      address.valid?
      expect(address.errors[:address_num]).to include("を入力してください")
    end
  end
end
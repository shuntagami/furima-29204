class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date
  has_one_attached :image

  # 空の投稿を保存できないようにする
  validates :name, :description, :price, presence: true
  validate :image_presence
  # ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :condition_id, :charge_id, :prefecture_id, :shipping_date_id, numericality: { other_than: 1 }

  # priceの範囲設定
  validates :price, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999
  }

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end

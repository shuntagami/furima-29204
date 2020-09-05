class Item < ApplicationRecord
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :charge
  belongs_to_active_hash :shipping_place
  belongs_to_active_hash :shipping_date
  has_one_attached :image


  #空の投稿を保存できないようにする
  validates :name, :description, :price, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :condition_id, :charge_id, :shipping_place_id, :shipping_date_id, numericality: { other_than: 1 } 

  # priceの範囲設定
  validates :price, :numericality => { 
                      :greater_than_or_equal_to=> 300, 
                      :less_than_or_equal_to => 9_999_999
                    }
end


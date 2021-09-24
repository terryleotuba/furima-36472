class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :goods_category
  belongs_to :goods_status
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_date
  
  validates :image, presence: true
  validates :goods_name, presence: true, length: { maximum: 40 }
  validates :goods_description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, 
  numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is invalid'}
  validates :goods_category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :goods_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank"}

end

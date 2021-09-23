class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :goods_category
  belongs_to :goods_status
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_date
  
  validates :goods_name, :goods_description, :price, presence: true
  validates :image,                                  presence: true

  validates :goods_category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :goods_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank"}

end

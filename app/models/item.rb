class Item < ApplicationRecord
  belongs_to :user
  has_one    :order
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :goods_category
  belongs_to :goods_status
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_date

  validates :images, presence: true
  validates :goods_name, presence: true, length: { maximum: 40 }
  validates :goods_description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は不正な値です' }
  validates :goods_category_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :goods_status_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください" }
  validates :shipping_cost_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :shipping_date_id, numericality: { other_than: 1, message: "を選択してください" }

  def self.search(search)
    if search != ""
      Item.where('goods_name LIKE(?)', "%#{search}%").or(Item.where('goods_description LIKE(?)', "%#{search}%"))
    else
      Item.all
    end
  end
end

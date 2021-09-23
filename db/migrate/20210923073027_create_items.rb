class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :goods_name,         null: false
      t.text       :goods_description,  null: false
      t.integer    :goods_category_id,  null: false
      t.integer    :goods_status_id,    null: false
      t.integer    :shipping_cost_id,   null: false
      t.integer    :prefecture_id,      null: false
      t.integer    :shipping_date_id,   null: false
      t.integer    :price,              null: false
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end

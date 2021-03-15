class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title  , null: false
      t.integer  :price  , null: false
      t.integer  :shipping_fee_id   , null: false
      t.text   :item_pr  , null: false
      t.references  :user  , foreign_key: true
      t.intger  :item_status_id  , null: false
      t.integer  :prefecture_id  , null: false
      t.integer  :shipping_day_id  , null: false
      t.integer  :category_id  , null: false

      t.timestamps
    end
  end
end

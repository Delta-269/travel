class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|

      t.string :title, null: false
      t.integer :category_id, null: false
      t.integer :area_id, null: false
      t.text :address, null: false
      t.text :text, null: false
      t.references :user, foregin_key: true
      t.timestamps
    end
  end
end

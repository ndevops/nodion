class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|

      t.text :uuid

      t.text :hostname
      t.text :status, default: 'new'

      t.integer :user_id
      t.integer :image_id
      t.integer :plan_id
      t.integer :region_id

      t.timestamps null: false
    end
  end
end

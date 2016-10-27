class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|

      t.text :uuid

      t.text :name

      t.text :ram
      t.integer :ram_value

      t.text :cpu
      t.integer :cpu_value

      t.text :storage
      t.integer :storage_value
      t.text :storage_type

      t.timestamps null: false
    end
  end
end

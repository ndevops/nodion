class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|

      t.text :uuid

      t.text :name
      t.text :version
      
      t.integer :distribution_id

      t.timestamps null: false
    end
  end
end

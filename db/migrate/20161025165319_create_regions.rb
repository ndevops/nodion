class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|

      t.text :uuid

      t.string :name

      t.timestamps null: false
    end
  end
end

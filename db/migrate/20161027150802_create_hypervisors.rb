class CreateHypervisors < ActiveRecord::Migration
  def change
    create_table :hypervisors do |t|

      t.text :hostname
      t.integer :port
      t.boolean :locked

      t.integer :region_id

      t.timestamps null: false
    end
  end
end

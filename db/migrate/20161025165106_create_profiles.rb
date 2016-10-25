class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|

      t.text :first_name
      t.text :last_name

      t.integer :user_id

      t.timestamps null: false
    end
  end
end

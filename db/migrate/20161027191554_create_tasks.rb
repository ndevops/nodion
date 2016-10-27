class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|

      t.text :name

      t.string :target_id
      t.integer :target_id

      t.timestamps null: false
    end
  end
end

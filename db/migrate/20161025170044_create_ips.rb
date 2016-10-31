class CreateIps < ActiveRecord::Migration
  def change
    create_table :ips do |t|

      t.integer :version
      t.text :value
      t.boolean :public
      t.boolean :used
      
      t.timestamps null: false
    end
  end
end

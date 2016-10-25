class CreateNodeIps < ActiveRecord::Migration
  def change
    create_table :node_ips do |t|

      t.integer :node_id
      t.integer :ip_id
      
      t.timestamps null: false
    end
  end
end

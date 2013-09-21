class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.integer :group_id
      t.integer :value

      t.timestamps
    end
  end
end

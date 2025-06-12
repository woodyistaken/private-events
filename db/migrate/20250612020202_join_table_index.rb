class JoinTableIndex < ActiveRecord::Migration[8.0]
  def change
    add_index :attendances, [ :user_id, :event_id ], unique: true
  end
end

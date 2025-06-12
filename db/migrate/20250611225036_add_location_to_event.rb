class AddLocationToEvent < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :location, :string
  end
end

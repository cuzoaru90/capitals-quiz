class AddRegionToState < ActiveRecord::Migration[5.0]
  def change
    add_column :states, :region, :string
  end
end

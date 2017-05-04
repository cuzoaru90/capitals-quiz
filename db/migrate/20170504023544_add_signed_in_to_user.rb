class AddSignedInToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :signed_in_at, :datetime
  end
end

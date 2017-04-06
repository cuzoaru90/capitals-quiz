class AddSavedAnswerToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :saved_an_answer, :boolean
  end
end

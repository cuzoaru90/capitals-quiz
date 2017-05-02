class AddQuizStartToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :started_quiz, :boolean
  end
end

class AddCorrectAnswerToState < ActiveRecord::Migration
  def change
    add_column :states, :correct_answer, :boolean
  end
end

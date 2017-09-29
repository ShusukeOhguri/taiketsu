class AddLikeToAssessments < ActiveRecord::Migration[5.0]
  def change
    add_column :assessments, :like, :integer
  end
end

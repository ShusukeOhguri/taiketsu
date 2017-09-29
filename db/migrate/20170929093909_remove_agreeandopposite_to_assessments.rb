class RemoveAgreeandoppositeToAssessments < ActiveRecord::Migration[5.0]
  def change
    remove_column :assessments, :agree, :integer
    remove_column :assessments, :opposite, :integer
  end
end

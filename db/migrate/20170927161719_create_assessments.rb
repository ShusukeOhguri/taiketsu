class CreateAssessments < ActiveRecord::Migration[5.0]
  def change
    create_table :assessments do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :opinion_id, null: false, foreign_key: true
      t.integer :agree
      t.integer :opposite
      t.timestamps
    end
  end
end

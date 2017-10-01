class CreateAssessments < ActiveRecord::Migration[5.0]
  def change
    create_table :assessments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :opinion, null: false, foreign_key: true
      t.integer :like
      t.timestamps
    end
  end
end

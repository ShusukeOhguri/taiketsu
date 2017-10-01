class CreateOpinions < ActiveRecord::Migration[5.0]
  def change
    create_table :opinions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :theme, null: false, foreign_key: true
      t.integer :side, null: false
      t.text    :text, null: false
      t.timestamps
    end
  end
end

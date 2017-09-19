class CreateOpinions < ActiveRecord::Migration[5.0]
  def change
    create_table :opinions do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :theme_id, null: false, foreign_key: true
      t.integer :side, null: false
      t.integer :agree
      t.integer :opposite
      t.text    :text, null: false
      t.timestamps
    end
  end
end

class CreateThemes < ActiveRecord::Migration[5.0]
  def change
    create_table :themes do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.string  :red, null: false
      t.string  :blue, null: false
      t.timestamps
    end
  end
end

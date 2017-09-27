class RemoveAgreeandoppositeToOpinions < ActiveRecord::Migration[5.0]
  def change
    remove_column :opinions, :agree, :integer
    remove_column :opinions, :opposite, :integer
  end
end

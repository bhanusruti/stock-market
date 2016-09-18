class AddColumnToVote < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :choice, :string
  end
end

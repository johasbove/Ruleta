class AddStatusToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :status, :integer
  end
end

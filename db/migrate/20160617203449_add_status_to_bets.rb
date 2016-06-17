class AddStatusToBets < ActiveRecord::Migration
  def change
    add_column :bets, :status, :integer
  end
end

class ChangeNumericFieldInRounds < ActiveRecord::Migration
  def up
    change_column :rounds, :total_bet, :decimal
    change_column :rounds, :total_payout, :decimal
  end

  def down 
    change_column :rounds, :total_bet, :float
    change_column :rounds, :total_payout, :float
  end
end

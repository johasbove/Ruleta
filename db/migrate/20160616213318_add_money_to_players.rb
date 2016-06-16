class AddMoneyToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :money, :decimal, default: 10000
  end
end

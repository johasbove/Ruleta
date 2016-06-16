class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.float :total_bet
      t.integer :spin_result
      t.float :total_payout

      t.timestamps null: false
    end
  end
end

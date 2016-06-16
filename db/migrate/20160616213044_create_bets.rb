class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.decimal :amount
      t.integer :bet_color
      t.decimal :payout
      t.references :round, index: true, foreign_key: true
      t.references :player, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

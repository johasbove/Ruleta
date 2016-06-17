# == Schema Information
#
# Table name: bets
#
#  id         :integer          not null, primary key
#  amount     :decimal(, )
#  bet_color  :integer
#  payout     :decimal(, )
#  round_id   :integer
#  player_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer
#

class Bet < ActiveRecord::Base
  COLORS = [:red, :black, :green]
  STATUS = [:acepted, :rejected]
  enum bet_color: COLORS
  enum status: STATUS

  before_save :verify_minimum_amount_restriction
  before_save :update_player_money, if: :acepted?

  belongs_to :round
  belongs_to :player

  validates :amount, :bet_color, :round, :player, presence: true
  validates :round, :player, associated: true

  private

  def verify_minimum_amount_restriction
    if self.amount <= 0
      self.player.broke!
      self.status = "rejected"
      # POR QUE LO ASIGNA DOS VECES?? ESTO SE ESTA EJECUTANDO DOS VECES?
      errors[:amount] << "Doesn't achieve the minimum amount"
    end
  end

  def update_player_money
    if self.payout?
      player = self.player
      player.money += self.payout
      player.save
    end
  end
end

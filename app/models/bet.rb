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
#

class Bet < ActiveRecord::Base
  COLORS = [:red, :black, :green]
  enum bet_color: COLORS

  before_save :verify_minimum_amount_restriction

  belongs_to :round
  belongs_to :player

  validates :amount, :bet_color, :round, :player, presence: true
  validates :round, :player, associated: true

  private

  def verify_minimum_amount_restriction
    if self.amount <= 0
      # NO SE CREA O DICE ALGO Y pone al jugador broke
    end
  end

  # METODO PARA HACER UPDATE DEL DINERO DE JUGADOR AL GUARDAR UNA APUESTA CON PAYOUT

end

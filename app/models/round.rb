# == Schema Information
#
# Table name: rounds
#
#  id           :integer          not null, primary key
#  total_bet    :decimal(, )
#  spin_result  :integer
#  total_payout :decimal(, )
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Round < ActiveRecord::Base
  COLORS = [:red, :black, :green]
  enum spin_result: COLORS

  has_many :bets

  private

  def generate_round
    available_players = Player.available
    # PODRIA QUITAR ESTA CONDICION Y GUARDAR CON UN LOG DE QUE NO HUBO JUGADORES
    unless available_players.empty?
      available_players.each do |player|
        player.generate_bet(self)
      end
      result_decision = Random.rand(100.0)
      case result_decision
      when 0..49
        self.spin_result = 1
      when 49..88
        self.spin_result = 2
      when 88..100
        self.spin_result = 3
      end
      bets = Bet.where(round_id: self.id)
      bets.each do |bet|
        if bet.bet_color == self.spin_result && (spin_result.red? || spin_result.black?)
          bet.payout = bet.amount * 2
        elsif bet.bet_color == self.spin_result && spin_result.green
          bet.payout = bet.amount * 15
        else
          bet.payout = 0
        end
      end
    end
  end
end

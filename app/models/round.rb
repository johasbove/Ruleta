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


  def self.generate_round
    Round.
    # r.bets.build(a.attributes)
  end
  def generate_round
    round = self.save
    available_players = Player.available
    # PODRIA QUITAR ESTA CONDICION Y GUARDAR CON UN LOG DE QUE NO HUBO JUGADORES
    unless available_players.empty?
      available_players.each do |player|
        player.generate_bet(round)
      end
      result_decision = Random.rand(100.0)
      case result_decision
      when 0..49
        self.red!
      when 49..98
        self.black!
      when 98..100
        self.green!
      end
      bets = Bet.where(round_id: self.id)
      bets.each do |bet|
        if bet.bet_color == self.spin_result && (self.red? || self.black?)
          bet.payout = bet.amount * 2
        elsif bet.bet_color == self.spin_result && self.green?
          bet.payout = bet.amount * 15
        else
          bet.payout = 0
        end
      end
      # cosas para hacerle al round
      round.save
    end
  end

  private

  def generate_result
    result_decision = Random.rand(100.0)
    case result_decision
    when 0..49
      self.red!
    when 49..98
      self.black!
    when 98..100
      self.green!
    end
  end
end

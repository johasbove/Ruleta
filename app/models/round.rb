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

  def generate_round available_players
    generation_logic(available_players)
  end

  def calculate_results
    calculate_total_payout
  end

  private
 
  def generation_logic available_players
    total_bet = 0
    available_players.each do |player|
      bet = self.bets.build
      player.generate_bet(bet)
      total_bet += bet.amount
    end
    self.spin_result = generate_spin_result
    self.total_bet = total_bet
    self.save
  end

  def generate_spin_result
    result_decision = Random.rand(100.0)
    case result_decision
    when 0..49
      "red"
    when 49..98
      "black"
    when 98..100
      "green"
    end
  end

  def calculate_total_payout
    total_payout = 0
    bets = self.bets
    bets.each do |bet|
      if bet.bet_color == self.spin_result && (self.red? || self.black?)
        bet.payout = bet.amount * 2
      elsif bet.bet_color == self.spin_result && self.green?
        bet.payout = bet.amount * 15
      else
        bet.payout = 0
      end
      if bet.save
        total_payout += bet.payout
      else
        errors[:base] << "Bet with id #{bet.id} couldn't be saved"
      end
    end
    self.total_payout = total_payout
    self.save
  end
end

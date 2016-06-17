class Simulator < ActiveRecord::Base
  
  def self.single_simulation
    round = Round.create
    available_players = Player.available
    if available_players.empty?
      errors[:base] << "The bet doesn't achieve the minimum amount"
    else
      round.generate_round(available_players)
    end
    round.calculate_results
  end
end

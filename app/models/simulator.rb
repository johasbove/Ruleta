class Simulator < ActiveRecord::Base
  @message = []
  
  def self.single_simulation
    round = Round.create
    available_players = Player.available
    if available_players.empty?
      @message << "There is no available player"
    else
      round.generate_round(available_players)
    end
    round.calculate_results
  end
end

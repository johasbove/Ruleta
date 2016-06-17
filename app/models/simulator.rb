class Simulator < ActiveRecord::Base
  def self.single_simulation
    @message = []
    round = Round.create
    available_players = Player.available
    if available_players.empty?
      @message << "There is no available player"
    else
      round.generate_round(available_players)
    end

  end
end

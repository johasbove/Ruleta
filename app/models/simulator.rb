class Simulator
  @message = []

  def self.single_simulation
    round = Round.new
    available_players = Player.available
    if available_players.empty?
      @message << "There's not available players"
    else
      round.generate_round(available_players)
      round.calculate_results
      round.save
    end
  end

  def self.assign_money_to_players
    Player.where.not(status: 2).update_all("money = money + 1000, status = 0")
  end
end

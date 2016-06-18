class Simulator
  @message = []

  def self.single_simulation
    round = Round.create
    available_players = Player.available
    if available_players.empty?
      @message << "The bet doesn't achieve the minimum amount"
    else
      round.generate_round(available_players)
    end
    round.calculate_results
  end

  def self.assign_money_players
    Player.where.not(status: 2).update_all("money = money + 1000, status = 0")
  end
end

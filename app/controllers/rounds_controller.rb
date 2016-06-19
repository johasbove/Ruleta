class RoundsController < ApplicationController
  def index
    # OJO! PAGINACION
    @rounds = Round.all
    # @bets = 
  end
end
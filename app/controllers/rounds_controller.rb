class RoundsController < ApplicationController
  def index
    @page_header = "Rounds' List"
    # OJO! PAGINACION
    @rounds = Round.all
    # @bets = 
  end
end
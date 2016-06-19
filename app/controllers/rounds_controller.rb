class RoundsController < ApplicationController
  def index
    @page_header = "Rounds' List"
    @rounds = Round.page(params[:page]).per(5)
  end
end
class PlayersController < ApplicationController

  def index
    @player = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.build(player_params)
    if @player.save
      redirect_to players_path, notice: 'Player created! Success'
    else
      flash.now[:alert] = @player.errors.full_messages.join('<br>- ')
      render :new
  end

  def show
    @player = Player.find(params[:player_id])
  end

  def edit
    @player = Player.find(params[:player_id])
  end

  def update
    @player = Player.find(params[:player_id])
    if @player.update(player_params)
      redirect_to player_path(@player), notice: 'Player edited! Success!'
    else
      flash.now[:alert] = @player.errors.full_messages.join('<br>- ')
      render :edit
    end
  end

  def destroy
    @player = Player.find(params[:player_id])
    if @player.disabled!
      flash[:notice] = 'Player deactivated! Success!'
      redirect_to players_path
    else
      flash[:alert] = @player.errors.full_messages.join('<br>- ')
      redirect_to player_path(@player)
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :lastname, :money)
  end
end

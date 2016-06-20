class PlayersController < ApplicationController

  def index
    if params[:search]
      @page_header = "Players' Search Result"
      @players = Player.search(params[:search]).page(params[:page]).per(5)
      # http://railscasts.com/episodes/37-simple-search-form
    else
      @page_header = "Players' List"
      @players = Player.page(params[:page]).per(5)
    end
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to players_path, notice: 'Player created! Success'
    else
      flash.now[:alert] = @player.errors.full_messages.join('<br>- ')
      render :new
    end
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to player_path(@player), notice: 'Player edited! Success!'
    else
      flash.now[:alert] = @player.errors.full_messages.join('<br>- ')
      render :edit
    end
  end

  def destroy
    @player = Player.find(params[:id])
    if @player.disabled!
      flash[:notice] = 'Player deactivated! Success!'
      redirect_to players_path
    else
      flash[:alert] = @player.errors.full_messages.join('<br>- ')
      redirect_to player_path(@player)
    end
  end

  def activate
    @player = Player.find(params[:id])
    if @player.money > 0
      if @player.available!
        flash[:notice] = 'Player activated! Success!'
        redirect_to players_path
      else
        flash[:alert] = @player.errors.full_messages.join('<br>- ')
        redirect_to player_path(@player)
      end
    else
      if @player.broke!
        flash[:notice] = 'Player activated! Success!'
        redirect_to players_path
      else
        flash[:alert] = @player.errors.full_messages.join('<br>- ')
        redirect_to player_path(@player)
      end
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :lastname, :money)
  end
end

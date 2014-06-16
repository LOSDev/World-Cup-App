class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end
  def edit
    @team = Team.find_by_name(params[:id])
  end

  def update
    @team = Team.find(params[:id])
   
    if @team.update(team_params)
      redirect_to teams_path
    else
      render 'edit'
    end
  end
   
  private
    def team_params
      params.require(:team).permit(:name, :win, :draw, :loss, :gf, :ga, :points)
    end
end

class GroupsController < ApplicationController
  respond_to :json

  def index
    @groups = Group.all.includes(:teams)
  end

  def show    
    @group = Group.includes(:matches => [:home_team, :away_team, :group]).find_by_name(params[:id])    
  end
end

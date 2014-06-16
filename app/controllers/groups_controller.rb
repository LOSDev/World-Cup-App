class GroupsController < ApplicationController
  
  respond_to :json

  def index
    @groups = Group.all
  end

  def show
    
    @group = Group.includes(:teams).find_by_name(params[:id])
    #@group.teams
    #respond_with @projects
  end
end

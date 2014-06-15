class GroupsController < ApplicationController
  
  respond_to :json

  def index
    groups = Group.all
    @g = groups.to_json(:include => :teams)
    respond_with @g
  end
end

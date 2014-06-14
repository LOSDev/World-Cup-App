class GroupsController < ApplicationController
  
  respond_to :json

  def index
    @groups = Group.all

    respond_with @groups
  end
end

class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_filter :load_match
  before_action :authenticate_user!, except: [:index]

  # GET /events
  # GET /events.json
  def index
    @events = @match.events.sort_by{ |a| (a.minute.to_i)}
    respond_to do |format|
      format.html { authenticate_user! }
      format.json {  }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = @match.events.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = @match.events.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to match_events_path(@match), notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to match_events_path(@match), notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to match_events_path(@match) }
      format.json { head :no_content }
    end
  end

  private
    def load_match
      @match = Match.find(params[:match_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:event_type, :player, :minute, :match_id, :home_team, :away_team)
    end
end

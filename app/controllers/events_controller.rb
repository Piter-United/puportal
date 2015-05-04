class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    @event_decorators = @events.ordered.decorate

    respond_to do |format|
      format.html
      format.json{ render json: @events, each_serializer: EventSerializer }
    end
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html{ redirect_to @event, notice: "Event was successfully created." }
      else
        format.html{ render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html{ redirect_to @event, notice: "Event was successfully updated." }
      else
        format.html{ render :edit }
      end
    end
  end

  def destroy
    @event.destroy

    respond_to do |format|
      format.html{ redirect_to events_url, notice: "Event was successfully destroyed." }
    end
  end

  private

  def search_query?
    params.except(:_method, :authenticity_token, :action, :controller, :utf8, :commit).any?
  end

  def find_event
    @event = Event.find(params[:id])
    @event_decorator = @event.decorate
  end

  def event_params
    params.require(:event).permit(
      :title,
      :description,
      :community_id,
      :date,
      :start,
      :finish,
      :tags,
      location: [:address, :latitude, :longitude]
    )
  end
end

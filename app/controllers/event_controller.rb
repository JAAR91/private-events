class EventController < ApplicationController
  def index
    @event = Event.all
  end

  def new
      @event = Event.new
  end

  def create
      @event = Event.new(event_params)
      if @event.save
        flash.alert = 'Event created succesfuly!'
        redirect_to event_path(@event.id)
      else
        flash.alert = 'Error unable to create the event'
        render :new
      end
  end
end

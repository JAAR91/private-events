class AttendeesController < ApplicationController
    def create
        @user = User.find(session[:user_id])
        @event = @user.events.find(params[:id])
        @attendee = @event.attendees.create(attendee_params)
        redirect_to event_path(@event.id)
    end
    
    private
    def attendee_params
        params.require(:attendee).permit(:status)
    end
end

class AttendeesController < ApplicationController
  def create
    @user = User.find_by(username: params[:username])
    @event = Event.find(params[:event_id])
    @attendees = @event.attendees.find_by(user_id: @user.id)
    current_user = User.find(session[:user_id])
    if @user.nil?
      redirect_to event_path(@event.id)
      flash[:notice] = 'That user does not exist.'
    elsif params[:username] == current_user.username
      redirect_to event_path(@event.id)
      flash[:notice] = 'Thats yourself!!'
    elsif @attendees.nil? || @attendees.status == 'canceled'
      @attendee = @event.attendees.create(status: 'pending', user_id: @user.id)
      redirect_to event_path(@event.id)
      flash[:notice] = "Invitation sent to #{@user.username}"
    else
      redirect_to event_path(@event.id)
      flash[:notice] = 'That user already have an invitatin for this event'
    end
  end

  def destroy
    @attendee = Attendee.find(params[:id])
    @attendee.destroy
    redirect_to event_path(params[:event_id])
  end

  def update
    @attendee = Attendee.find(params[:id])
    if @attendee.update(status: attemdee_params)
      check_event(@attendee.event_id)
      redirect_to event_path(@attendee.event.id)
      flash[:notice] = 'Invitation updated'
    else
      redirect_to event_path(@attendee.event.id)
      flash[:notice] = 'Invitation cant be updated'
    end
  end

  private

  def check_event(event_id)
    @event = Event.find(event_id)
    @attendees = @event.attendees
    if @event.tpeople == @attendees.count
      @attendees.each do |attendee|
        attendee.status = 'canceledfull'
      end
    end
    nil
  end

  def attemdee_params
    if params[:commit] == 'Accept'
      'accepted'
    elsif params[:commit] == 'Decline'
      'declined'
    else
      'canceled'
    end
  end
end

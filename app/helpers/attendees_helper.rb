module AttendeesHelper
  def invitations_owner_check(event)
    array = []
    if session[:user_id] == event.user_id
      array.push(render('attendees/inviteform'))
      array.push(render('attendees/invitations'))
    end
    invitation = event.attendees.find_by(user_id: session[:user_id])
    if event.tpeople == event.attendees.where(status: 'accepted').count
      flash.now[:notice] =
        'This event is not accepting any more people'
    end
    if !invitation.nil? && event.tpeople != event.attendees.where(status: 'accepted').count
      array.push(render('attendees/edit', attendee: invitation)) if invitation.status == 'pending'
      if invitation.status == 'accepted'
        flash.now[:notice] = 'You have accepted the invitation from this event!'
        array.push(render('attendees/cancel', attendee: invitation))
      end
      if invitation.status == 'declined'
        flash.now[:notice] =
          'You have already declined the invitation from this event!'
      end
      if invitation.status == 'canceledfull'
        flash.now[:notice] =
          'This event is already full and its not accepting more people'
      end
      if invitation.status == 'canceled'
        flash.now[:notice] =
          'You have canceled the inviation to this event'
      end
    end
    array
  end

  def attedees_count(event)
    a_count = event.attendees.where(status: 'accepted')
    return 0 if a_count.nil?

    a_count.count
  end

  def list_group_color(attendee)
    if attendee.event.date.future?
      return 'list-group-item-success'
    else
      return 'list-group-item-dark'
    end
  end
end

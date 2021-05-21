module AttendeesHelper
    def invitations_owner_check(user_id)
        array = []
        if session[:user_id] == user_id
            array.push(render "attendees/inviteform")
            array.push(render "attendees/invitations")
        end
        array
    end
end

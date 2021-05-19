module EventHelper
    def event_title(user, event)
        if user
          link_to event.title, event_path(event.id),
                  class: 'link-info text-decoration-none text-break'
        else
          event.title
        end
    end

    def event_post(user)
        if user.nil?
          return
        else
          link_to '<button class="btn btn-success" type="button">Create Event</button>'.html_safe, new_user_event_path(user.id),
                  class: 'link-success text-decoration-none text-uppercase'
        end
    end
end

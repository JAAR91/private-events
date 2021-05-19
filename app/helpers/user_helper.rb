module UserHelper
    def user_session(user)
        array = []
        if user
        array[0] = link_to 'Sign Out', logout_path, method: :destroy, class: 'nav-link active'
        else
        array[0] = link_to 'Register', new_user_path, class: 'nav-link active'
        array[1] = link_to 'Sign In', login_path, class: 'nav-link active'
        end
        array
    end

    def user_name(user)
        if user.nil?
            'Not logged in'
        else
            user.name
        end
    end
end

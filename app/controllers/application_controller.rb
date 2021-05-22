class ApplicationController < ActionController::Base
    def authenticate_user!
        unless session[:user_id].nil?
            @user = User.find(session[:user_id])
            redirect_to login_path if @user.nil?
        else
            redirect_to login_path
        end
    end
end

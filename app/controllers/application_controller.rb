class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    helper_method :current_cart
    helper_method :signed_in?
    
    def current_cart
        current_user.current_cart if current_user
    end
    
    def signed_in?
        if !user_signed_in?
            redirect_to new_user_session_path
        end
    end
end

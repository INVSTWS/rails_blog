class ApplicationController < ActionController::Base
    before_action :set_query
    before_action :configure_permitted_parameters, if: :devise_controller?

    def set_query
        @query = Post.ransack(params[:q])
    end 



    

    protected
  
    def configure_permitted_parameters
      attributes = [:username, :email, :password, :password_confirmation]
      devise_parameter_sanitizer.permit(:sign_in, keys: attributes)
      devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
      devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    end
end

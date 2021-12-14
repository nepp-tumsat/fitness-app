class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :authenticate_account!, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller? 

  respond_to :json

  private

    def devise_token_auth_controller?
      params[:controller].split('/')[0] == 'devise_token_auth'
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end 
end
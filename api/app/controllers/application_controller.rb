class ApplicationController < ActionController::API
  include ActionController::Helpers
  include DeviseTokenAuth::Concerns::SetUserByToken

  #before_action :authenticate_user!, except: [:new, :create]
  before_action :configure_permitted_parameters, if: :devise_controller? 
  helper_method :current_user

  respond_to :json

  private

  def configure_permitted_parameters #必要なパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:birthday,:tall,:gender])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:session])
  end 
end
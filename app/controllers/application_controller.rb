class ApplicationController < ActionController::API
  skip_before_action :verify_authenticity_token, raise: false
  
 before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end


include JwtToken
before_action:authenticate_user
private
  def authenticate_user
    header = request.headers['Authorization']
    header = header.split('').last if header 
    begin 
      @decoded = JwtToken.jwt_decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json:{ errors: e.message }, status: :unauthorized
    end
  end






end

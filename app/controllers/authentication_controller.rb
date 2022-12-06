class AuthenticationController < ApplicationController
 skip_before_action :authenticate_user
 # POST /auth/login
 def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
        token = JwtToken.jwt_encode(user_id:@user_id)
        time = Time.now + 24.hours.to_i
        render json:{ token: token, exp: time.strftime("%m-%d-%Y %H:%M").
    else
        render json: {error: 'unauthorized'}, status::unauthorized
        end
    end
end             
 username: @user.user_name }, status: :ok


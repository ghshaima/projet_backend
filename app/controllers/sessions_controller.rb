class SessionsController < ApplicationController
    def create
        user = User.find_by_email(params[:email].downcase)
        if user && user.authenticate(params[:password])
        if user.email_confirmed
            sign_in user
          redirect_back_or user
        else
          flash.now[:error] = 'Please activate your account by following the 
          instructions in the account confirmation email you received to proceed'
          render 'new'
        end
        else
          flash.now[:error] = 'Invalid email/password combination' # Not quite right!
          render 'new'
        end
    end

    #def create
      #user = User
       #       .find_by(email: params["user"]["email"])
        #      .try(:authenticate, params["user"]["password"])
  
      #if user
       # session[:user_id] = user.id
        #render json: {
         # status: :created,
          #logged_in: true,
          #user: user
        #}
      #else
       # render json: { status: 401 }
      #end
    #end
  end
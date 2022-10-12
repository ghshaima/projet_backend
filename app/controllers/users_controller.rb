class UsersController < ApplicationController

    def new
    @user = User.new
    end

    def create
      user = User.create!(
        firstname: params['firstname'],
        lastname: params['lastname'],
        email: params['email'],
        password: params['password'],
        role: params['role'].to_i
      )
  if user
        UserMailer.registration_confirmation(user).deliver
  
  
        render json: {
          status: :created,
  
          user: user
        }
  
      end
    end


    #def create
      #@user = User.new(user_params)    
      #@user.save
    #end

    def confirm_email
      user = User.find_by_confirm_token(params[:id])
      if user
        user.email_confirmed = true
        user.confirm_token = nil
        user.save
     #   redirect_to 'http://localhost:4200/login'
  
        #flash[:success] = "Welcome to the Sample App! Your email has been confirmed.Please sign in to continue."
        #redirect_to signin_url
      else
        #flash[:error] = "Sorry. User does not exist"
        # redirect_to root_url
        render json: { status: 500 }
  
      end
  
    end


  def show
  end

  def edit
    if !logged_in? || !@user
      redirect_to root_path
    end
  end
      
  def update
    if @user.update(user_params)
        redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end
  def user_params
    params.permit(:email, :password, :role, :firstname, :lastname)
  end

end

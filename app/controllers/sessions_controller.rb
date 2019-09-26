class SessionsController < ApplicationController
    def new
        @user = User.new
    end
 
    def create
        
        @user = User.find_by(email: params[:user][:email])
        if @user.nil?
            redirect_to users_sign_in_path, alert: "no existes"
        end
        if @user.password == params[:user][:password]
            session[:user_id] = @user.id
            redirect_to root_path, notice: 'Has ingresado'
        else
            redirect_to users_sign_in_path, alert: "no existes"      
        end
    end
    def destroy
        reset_session
        redirect_to root_path
    end
    private
    def user_params
        params.require(:user).permit(:email, :password)
    end   
          
end

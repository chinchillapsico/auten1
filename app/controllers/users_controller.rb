class UsersController < ApplicationController

    def new
        @user = User.new
    end 
    def create
        #generamos una nueva instancia de user con @user recibiendo user_params strong
        @user = User.new(user_params)
        if @user.save
            #si el usuario está guardado, se guadará el user id dentro de la sesión (después de cre<r el usuario)
            session[:user_id] = @user.id
            redirect_to root_path
        else
            #si el usuari no es guardado redrecciona para crearlo nuevamente.
            render :new
        end        
    end    
     
    private
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end    
end

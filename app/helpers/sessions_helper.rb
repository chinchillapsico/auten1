module SessionsHelper
    def current_user
        User.find(session[:user_id])
    end
    def logged?
        # busca si el usuario  (id) está presente con un operador ternario ? :, si está es true sino es false
        session[:user_id].present? ? true : false
    end 
end

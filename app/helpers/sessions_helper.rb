module SessionsHelper

   def create_session(user)
     session[:user_id] = user.id
     user.update_attributes(signed_in_at: Time.now)
   end
 
   def destroy_session(user)
     session[:user_id] = nil
   end
 
   def current_user
     User.find_by(id: session[:user_id])
   end

end

class OmniAuth::OmniauthCallbacksController < Devise::OmniauthCallbacksController
 
  skip_before_action :authorize ,only: :google_oauth2

	def google_oauth2
    auth_details = request.env["omniauth.auth"]
    # if Rails.env.production?
    #   user = User.from_omniauth(request.env["omniauth.auth"]) if auth_details.info['email'].split("@")[1] == "vinsol.com"
    # else
    #FIXME_AB: What if request.env["omniauth.auth"] is nil or blank? You should handle the worst cases.
       user = User.from_omniauth(request.env["omniauth.auth"])
    # end
    if user && user.persisted?
        flash.notice = user.name + " signed in successfully"
        sign_in user
        redirect_to session[:previous_url]  || "/"
    else
      redirect_to new_user_session_path
      flash.notice = "You are not authorized to login. Kindly contact administrator "
    end 
  end

end

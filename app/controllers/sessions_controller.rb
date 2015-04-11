class SessionsController < ApplicationController
    	def new
    	end
       def create
        user = User.find_by_email(params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          sign_in user 
          respond_to do |format|
            format.html { redirect_to root_path, error: 'YOU FORGET THE LIST' }
            format.json { render json: user}
          end
          # redirect_to root_path
        else
			flash.now[:error] = 'Invalid email/password combination'          
			render 'new'
        end
     end

      def destroy
        sign_out
        respond_to do |format| 
          format.html {redirect_to signin_url}
          format.json {render json: "loggedOut"}
        end
        
      end 
end
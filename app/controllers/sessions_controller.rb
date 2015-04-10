class SessionsController < ApplicationController
    	def new
    	end
       def create
        user = User.find_by_email(params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          puts "Authenticated"
          sign_in user 
          format.html { redirect_to root_path, notice: 'Welcome to the jungle' }
          format.json { render json: user}
          # redirect_to root_path
        else
          puts "not Atuhenticated"
			flash.now[:error] = 'Invalid email/password combination'          
			render 'new'
        end
     end

      def destroy
        sign_out
        redirect_to signin_url
      end 
end
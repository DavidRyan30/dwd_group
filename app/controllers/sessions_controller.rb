class SessionsController < ApplicationController
	def new

	end
       def create
        user = User.find_by_email(params[:session][:email].downcase)
        if user
        	puts "got here"
        	puts user.email
        	puts user.password
        else
        	puts "No user returned"
        end
        
        if user && user.authenticate(params[:session][:password])
          sign_in user 
          redirect_to user 
        else
			flash.now[:error] = 'Invalid email/password combination'          
			render 'new'
        end
     end

      def destroy
        sign_out
        redirect_to signin_url
      end 
end
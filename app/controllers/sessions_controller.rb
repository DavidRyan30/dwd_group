class SessionsController < ApplicationController
	def new

	end
       def create
            @session = params[:session]
            if @session == {}
              user1 = User.find_by_email(params[:email])
              @session = user.remember_token
            end
        user = User.find_by_email(params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          sign_in user 
          format.html { redirect_to root_path, notice: 'User was successfully updated.' }
          format.json { render json: user}
          
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
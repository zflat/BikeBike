class UserSessionsController < ApplicationController
	def new
		session[:return_to] ||= request.referer
		@user = User.new
	end

	def create
		if @user = login(params[:login_email], params[:login_password])
			redirect_to session.delete(:return_to) || 'pages#home'
		else
			flash.now[:alert] = "Login failed"
			@user = User.new
			render action: "new"
		end
	end

	def destroy
		logout
		redirect_to(:root, notice: 'Logged out!')
	end
end

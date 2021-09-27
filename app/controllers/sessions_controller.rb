class SessionsController < Devise::SessionsController
	def new
		@user = User.new
	end

	def create
		@user = User.find_by_email(params[:user][:email])
		if @user != nil
			sign_in @user
			redirect_to root_path
		#elsif current_user is sign_out?
		#	redirect_to root_path
		end
	end
end
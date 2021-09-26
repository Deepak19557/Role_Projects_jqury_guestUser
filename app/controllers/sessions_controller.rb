class SessionsController < Devise::SessionsController

	def new
		@user = User.new
		@appointment = Appointment.last
	end

	def create
		@user = User.find_by_email(params[:user][:email])
		if @user != nil
			sign_in @user
			redirect_to root_path		
		end
	end
end
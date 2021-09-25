class SessionsController < Devise::SessionsController

	def new
		@user = User.new
		@appointment = Appointment.last
	end

	def create
		@user = User.find_by_email(params[:user][:email])
		if @user != nil# and current_user.role == 'admin'
			sign_in @user
			#redirect_to new_home_path
			redirect_to root_path		
		#elsif @user != nil and current_user.role == 'doctor'
		##	redirect_to edit_appointment_path(@appointment)
		#elsif @user != nil and current_user.role == 'patient'
		#	sign_in @user
		#	redirect_to edit_user_path(@user) 
		end
	end
end
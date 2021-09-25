class UsersController < ApplicationController
	def new
		@appointment = Appointment.new
	end

	def edit
		@user = Appointment.find(params[:id])
	end
	def update
		@user = Appointment.find(params[:id])
		@user.update(params[:appointment][:patient_id],params[:appointment][:doctor_id],params[:appointment][:day])
	end
	def show
		debugger
	end
end

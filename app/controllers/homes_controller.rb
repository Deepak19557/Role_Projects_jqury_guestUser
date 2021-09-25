class HomesController < ApplicationController
	def page_1
		if current_user.role == 'patient'
			#debugger
			# @appointment = Appointment.new
			#@patient = Patient.create(name: params[:name])
			#@doctor  = Doctor.create(name: params[:name])
			@patient = Patient.find_by(name: params[:name])
			@doctor = Doctor.find_by(name: params[:name])
		    @patient.doctors << @doctor
		end
	end
	def new
		
	end
end

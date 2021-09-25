class AppointmentsController < ApplicationController
	  
  def index
    if current_user.role == "Patient"
      @appointments = Appointment.where(user_id: current_user.id)
    elsif current_user.role == "Doctor"
      doctor = Doctor.find_by(email: current_user.email)
      @appointments = Appointment.where(doctor_id: doctor.id)
    else
      @appointments = Appointment.all
      render :admin
    end
  end

  def new
  	@appointment = Appointment.new	
  end

  def create
  	@appointment = Appointment.new(appointment_params)
    @appointment.user_id = current_user.id
    if @appointment.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    
    @appointment = Appointment.find(params[:id])

  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to root_path
    else
      render 'edit'
    end 
  end

  def destroy
    @destroy = Appointment.find(params[:id])
    @destroy.destroy
    redirect_to root_path
  end
  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :day)
  end

end

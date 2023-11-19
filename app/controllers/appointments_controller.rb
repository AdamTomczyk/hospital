class AppointmentsController < ApplicationController

  def new
    @appointment = Appointment.new
    @patient = Patient.find(params[:patient_id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @patient = Patient.find(params[:patient_id])
    @appointment.patient = @patient
    @appointment.save

    redirect_to patient_path(@patient)

  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :reason, :urgent, :doctor_id)
  end
end

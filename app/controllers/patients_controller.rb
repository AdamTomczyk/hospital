class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
    @appointment_count = @patient.appointments.select {|appointment| appointment.patient == @patient }.count || 0

  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.save

    redirect_to patient_path(@patient)
  end

  def edit

  end

  def update

  end

  def delete

  end

  def update_cure
    @patient = Patient.find(params[:id])
    last_url = request.referrer.split("/").last
    @patient.update(cured: !@patient.cured)

    if @patient.cured
      @patient.appointments.map do |appointment|
        datetime = DateTime.now
        appointment = (appointment.patient == @patient && (datetime.today? || datetime.to_date.future?))  ? appointment : nil
        appointment.destroy
      end
    end
    if /\A\d+\z/.match?(last_url)
    redirect_to patient_path(@patient)
    else
    redirect_to patients_path
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :insurance, :emoji_avatar, :gender, :age)
  end
end

class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all.order(:experience).reverse
    @avaialbe_doctors = @doctors.select{|doctor| doctor.available}
    @unavailbe_doctors = @doctors.reject{|doctor| doctor.available}
  end

  def show
    @doctor = Doctor.find(params[:id])
    @average = 0 || @doctor.educations.pluck(:score).reduce{|a,b| a + b} / (@doctor.educations.length)
  end

  def new
    @doctor = Doctor.new
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    @doctor.update(doctor_params)

    redirect_to doctor_path(@doctor)
  end

  def create
    @doctor = Doctor.new(doctor_params)
    @doctor.save

    redirect_to doctor_path(@doctor)
  end

  def update_available
    @doctor = Doctor.find(params[:id])
    last_url = request.referrer.split("/").last
    @doctor.update(available: !@doctor.available)
    if /\A\d+\z/.match?(last_url)
    redirect_to doctor_path(@doctor)
    else
      redirect_to doctors_path
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:experience, :first_name, :last_name, :speciality, :title, :emoji_avatar)
  end

end

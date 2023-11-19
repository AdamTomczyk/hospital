class EducationsController < ApplicationController

  def new
    @education = Education.new
    @doctor = Doctor.find(params[:doctor_id])
  end

  def create
    @education = Education.new(eduction_params)
    @doctor = Doctor.find(params[:doctor_id])
    @education.doctor = @doctor

    @education.save

    redirect_to doctor_path(@doctor)
  end

  private

  def eduction_params
    params.require(:education).permit(:university, :score, :degree)
  end

end

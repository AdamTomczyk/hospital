class PagesController < ApplicationController
  def home
    @paths = ["doctors", "appointments", "patients"]
  end
end

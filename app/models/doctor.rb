class Doctor < ApplicationRecord
  has_many :educations
  has_many :appointments
  has_many :patients, through: :appointments

  def create_collection_tag
    "#{self.title}. #{self.first_name} #{self.last_name} - #{self.speciality}"
  end
end

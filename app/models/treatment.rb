class Treatment < ActiveRecord::Base
  belongs_to :disease
  belongs_to :doctor
  has_many :patients
end

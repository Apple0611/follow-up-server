class Doctor < User
  belongs_to :department
  has_many :intern
  has_many :treatment
end

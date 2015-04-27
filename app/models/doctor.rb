class Doctor < User
  belongs_to :department
  has_many :interns
  has_many :treatments
end

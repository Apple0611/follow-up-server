class Treatment < ActiveRecord::Base
  
  validates :name, presence: {
    message: "科室名称必填"
  }
  validates :name, uniqueness: {
    message: "科室名称必须唯一"
  }

  belongs_to :disease
  belongs_to :doctor
  has_many :patients

  self.per_page = 10
end

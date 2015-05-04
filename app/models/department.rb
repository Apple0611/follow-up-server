class Department < ActiveRecord::Base
  validates :name, presence: {
    message: "科室名称必填"
  }
  validates :name, uniqueness: {
    message: "科室名称必须唯一"
  }

  has_many :users
  has_many :doctors
  has_and_belongs_to_many :categories

end

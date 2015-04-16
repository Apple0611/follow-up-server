class Department < ActiveRecord::Base
  validates :name, {
    message: "科室名称必填"
  }
  validates :name, uniqueness: {
    message: "科室名称必须唯一"
  }

  has_many :users
  has_and_belongs_to_many :disease_categories

end

class Department < Category
  validates :name, presence: {
    message: "科室名称必填"
  }
  validates :name, uniqueness: {
    message: "科室名称必须唯一"
  }

  has_many :doctors
  has_many :diseases
  belongs_to :category

end

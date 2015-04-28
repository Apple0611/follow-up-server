class Disease < ActiveRecord::Base

  validates :name, presence: {
    message: "疾病名称必填"
  }
  validates :name, uniqueness: {
    message: "疾病名称必须唯一"
  }

  belongs_to :category
  has_many :treatments

end

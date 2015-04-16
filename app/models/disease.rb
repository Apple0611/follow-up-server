class Disease < ActiveRecord::Base

  validates :name, {
    message: "疾病名称必填"
  }
  validates :name, uniqueness: {
    message: "疾病名称必须唯一"
  }

end

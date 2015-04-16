class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: {
    message: "确认密码必须和密码一致"
  }
  validates :password_confirmation, presence: {
    message: "确认密码必须输入"
  }

  validates :email, uniqueness: true
end

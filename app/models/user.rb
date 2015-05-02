class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :email, uniqueness: {
    message: "此邮箱或电话号码已注册"
  }
  validates :password, length: {
    in: 6..20,
    too_short: "密码至少需6位",
    too_long: "密码至多20位"
  }
  validates :term, acceptance: {
    message: "必须同意服务条款"
  }
end

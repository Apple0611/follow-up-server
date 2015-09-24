class Identity < OmniAuth::Identity::Models::ActiveRecord

  validates :email,
  presence: {
    message: "邮箱或电话号码不能为空"
  },
  uniqueness: {
    message: "此邮箱或电话号码已注册"
  },
  format: {
    with: /([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})/i,
    message: "邮箱或电话号码格式不正确"
  }

  validates :password,
  presence: {
    message: "密码不能为空"
  },
  length: {
    in: 6..20,
    too_short: "密码至少需6位",
    too_long: "密码至多20位"
  }

  validates :term, acceptance: {
    message: "必须同意服务条款"
  }
end

## Normal User Controller for Devise Authentication
## Use alternative fields (email|mobile) as login for authentication
## Author: Mingdong Luo (https://github.com/mdluo)
## Date: Oct 08, 2015

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, authentication_keys: [:login]
  # devise :validatable, password_length: 0..128

  # Virtual attribute for authenticating by either mobile or email
  attr_accessor :login

  validates :login, presence: true
  validates :password, presence: true, length: { in: 6..128 }
  validate :login_validate
  validates :term, acceptance: true

  before_create do
    if login =~ @@mobile_regex
      self.mobile = login
    elsif login =~ @@email_regex
      self.email = login
    end
  end

  # Allow users to Sign In using their mobile or email address
  # http://git.io/vCUn6
  # warden_conditions == {login: "email or mobile"}
  def self.find_for_database_authentication(warden_conditions)
    if login = warden_conditions[:login]
      where(["lower(mobile) = :value OR lower(email) = :value", { value: login.downcase }]).first
    end
  end

  private
  # China mobile phone number regex: http://git.io/vCtiM
  @@mobile_regex = /(^(13\d|14[57]|15[^4,\D]|17[678]|18\d)\d{8}|170[059]\d{7})$/
  @@email_regex = Devise::email_regexp

  # Validate 'login' field for different format (email or mobile)
  # Docs of customed validation: http://guides.rubyonrails.org/active_record_validations.html#custom-methods
  # http://guides.rubyonrails.org/i18n.html#translations-for-active-record-models
  def login_validate
    if login =~ @@mobile_regex
      errors.add :login, :mobile_exists if User.where(mobile: login.downcase).any?
    elsif login =~ @@email_regex
      errors.add :login, :email_exists if User.where(email: login.downcase).any?
    else
      errors.add :login, :invalid
    end
  end
end

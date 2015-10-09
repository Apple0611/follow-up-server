## Normal User Controller for Devise Authentication
## Use alternative fields (email|mobile) as login for authentication
## Author: Mingdong Luo (https://github.com/mdluo)
## Date: Oct 08, 2015

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:login]

  # Virtual attribute for authenticating by either mobile or email
  attr_accessor :login

  validates :login, presence: true
  validates :password, length: { in: 6..20 }
  validate :login_validate
  validates :term, acceptance: true

  # Allow users to Sign In using their mobile or email address
  # http://git.io/vCUn6
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(mobile) = :value OR lower(email) = :value", { value: login.downcase }]).first
    else
      where(conditions.to_hash).first
    end
  end

  private

  # Use 'login'(eighter email or mobile) as authentication_keys
  # So email are not required for validation
  # See more: http://git.io/vCTgV
  def email_required?
    return false
  end

  # Validate 'login' field for different format (email or mobile)
  # Docs of customed validation: http://guides.rubyonrails.org/active_record_validations.html#custom-methods
  # http://guides.rubyonrails.org/i18n.html#translations-for-active-record-models
  def login_validate
    if login =~ /(^(13\d|14[57]|15[^4,\D]|17[678]|18\d)\d{8}|170[059]\d{7})$/
      if User.where(mobile: login.downcase).any?
        errors.add(:login, :mobile_exists)
      end
    elsif login =~ /([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})/i
      if User.where(email: login.downcase).any?
        errors.add(:login, :email_exists)
      end
    else
      errors.add(:login, :invalid)
    end
  end

end

class User < ActiveRecord::Base

  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.id = auth["id"]
    end
  end

  def self.find_by_provider_and_uid(provider, uid)
    case provider
    when 'identity'
      return User.find_by_id(uid);
    end
  end
end

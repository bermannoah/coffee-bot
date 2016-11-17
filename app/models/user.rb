class User < ApplicationRecord
  after_create :create_tenant
  has_secure_password
  
  enum role: [:default, :admin]
  
  def self.create_from_slack(user_info)
    return false if user_info["ok"] != true #Being explicit to avoid false positives on authentication (i.e. don't allow truthy)
    user = find_or_initialize_by(slack_uid: user_info["user"]["id"]) do |u|
      u.username           = user_info["user"]["name"]
      u.slack_access_token = user_info["access_token"]
    end
      user.save ? user : false
  end

  
  private
  
  def create_tenant
    Apartment::Tenant.create(subdomain)
  end
  
end

class User < ApplicationRecord
  after_create :create_tenant
  has_secure_password
  
  enum role: [:default, :admin]
  
  private
  
  def create_tenant
    Apartment::Tenant.create(subdomain)
  end
  
end

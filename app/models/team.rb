class Team < ActiveRecord::Base
  after_create :create_tenant
  has_many :brews
  
  private
  
  def create_tenant
    Apartment::Tenant.create(team_name)
  end
  
end
class TeamsBrews < ActiveRecord::Base
  belongs_to :team
  belongs_to :brew
end
  
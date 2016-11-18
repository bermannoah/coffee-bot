class Team < ActiveRecord::Base
  has_many :teams_brews
  has_many :brews, through: :teams_brews
end
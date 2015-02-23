class OwnedGame < ActiveRecord::Base
  belongs_to :steam_profile
end

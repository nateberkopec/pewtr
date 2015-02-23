class SteamImporter
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    summary = Steam::User.summary(user.steam_id)
    user.build_steam_profile do |sp|
      steam_profile_attrs.each do |spa|
        sp.public_send(spa + "=", summary[spa])
      end
      steam_datetime_attrs.each do |spa|
        sp.public_send(spa + "=", Time.at(summary[spa]))
      end
      sp.steam_level = Steam::Player.steam_level(user.steam_id)
    end

    user.save!
  end

  private

  def steam_profile_attrs
    %w[personaname profileurl avatar avatarmedium avatarfull steam_level loccountrycode locstatecode loccityid]
  end

  def steam_datetime_attrs
    %w[lastlogoff timecreated]
  end
end

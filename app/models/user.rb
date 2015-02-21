class User < ActiveRecord::Base
  enum system_spec: [ :low, :medium, :high ]
  validates :first_name, :last_name, :has_platform?, presence: true

  def self.from_omniauth(hash)
    User.find_or_initialize_by steam_id: hash["uid"].split("/").last
  end

  def setup?
    %w[first_name last_name system_spec has_platform?].all? { |u| public_send u }
  end

  def has_platform?
    has_mac || has_windows || has_linux
  end
end

class AddSteamAttrsToUser < ActiveRecord::Migration
  def change
    create_table :steam_profiles do |t|
      t.integer :user_id
      t.index :user_id

      t.string :steamid
      t.string :personaname
      t.string :profileurl
      t.string :avatar
      t.string :avatarmedium
      t.string :avatarfull
      t.datetime :lastlogoff
      t.string :steam_level

      t.datetime :timecreated
      t.string :loccountrycode
      t.string :locstatecode
      t.string :loccityid

      t.timestamps null: false
    end

    create_table :owned_games do |t|
      t.integer :steam_profile_id
      t.index :steam_profile_id

      t.integer :appid
      t.integer :playtime_forever

      t.timestamps null: false
    end

    create_table :steam_apps do |t|
      t.integer :appid
      t.index   :appid
      t.string  :name

      t.timestamps null: false
    end
  end
end

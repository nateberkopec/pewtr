class AddSetupAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :has_mac, :boolean, default: false
    add_column :users, :has_windows, :boolean, default: false
    add_column :users, :has_linux, :boolean, default: false

    add_column :users, :system_spec, :integer, default: 1

    add_index :users, :steam_id
  end
end

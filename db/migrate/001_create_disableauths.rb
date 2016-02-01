class CreateDisableauths < ActiveRecord::Migration
  def self.up
    add_column(:projects, "disable_auth", :bool, default: false)
  end

  def self.down
  	remove_column(:projects,"disable_auth")
  end
end

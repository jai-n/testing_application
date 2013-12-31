class AddDefaultRoleAdminToUsers < ActiveRecord::Migration
  def up
    change_column :users, :role, :string, :default => "Student"
	end

	def down
	    change_column :users, :role, :string, :default => nil
	end
end

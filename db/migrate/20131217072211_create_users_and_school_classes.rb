class CreateUsersAndSchoolClasses < ActiveRecord::Migration
  def change
    create_table :users_school_classes do |t|
      t.belongs_to :user
      t.belongs_to :school_class
    end
  end
end

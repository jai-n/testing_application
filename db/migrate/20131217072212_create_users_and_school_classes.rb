class CreateUsersAndSchoolClasses < ActiveRecord::Migration
  def change
    create_table :school_classes_users do |t|
      t.belongs_to :user
      t.belongs_to :school_class
    end
  end
end

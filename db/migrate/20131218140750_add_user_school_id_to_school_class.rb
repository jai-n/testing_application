class AddUserSchoolIdToSchoolClass < ActiveRecord::Migration
  def change
    add_reference :school_classes, :user_school, index: true
  end
end

class UserSchool < ActiveRecord::Base
  belongs_to :user
  belongs_to :my_school
  has_many :school_classes
end

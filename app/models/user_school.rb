class UserSchool < ActiveRecord::Base
  belongs_to :user
  belongs_to :my_school
end

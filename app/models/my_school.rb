class MySchool < ActiveRecord::Base
	has_many :users, through: :user_school    
end

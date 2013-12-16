class MySchool < ActiveRecord::Base
	has_many :users, through: :user_school  
	has_many :user_school  
end

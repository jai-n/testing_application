class SchoolClass < ActiveRecord::Base
	has_and_belongs_to_many :users #,:class_name=>"users_school_classes"
	has_many :theory_days
	belongs_to :user_school
	accepts_nested_attributes_for :theory_days, :users
end

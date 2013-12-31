class MySchool < ActiveRecord::Base
	has_many :users, through: :user_school  
	has_many :user_school 
	has_many :school_classes

	validates :name, :website_url, :company_name,:contact_name,:email,:phone_number,:vat_number,
						:address,:city,:post_code,:note,:active, presence: true 
	validates_format_of :name, :with => /^[a-zA-Z ]*$/i,
											:message => "can only contain letters.",length: { minimum: 3 },:multiline => true
end

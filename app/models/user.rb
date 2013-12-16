class User < ActiveRecord::Base
	ROLES = %w[admin teacher student]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_one :my_school, through: :user_school  
	has_one :user_school
	accepts_nested_attributes_for :user_school  
	
	# after_create :send_welcome_mail

	validates :first_name, :last_name, :role,:group,:phone,presence: true
	validates :first_name, length: { minimum: 3 }
	validates_format_of :first_name, :with => /^[a-zA-Z ]*$/i,
											:message => "can only contain letters.",:multiline => true
	validates_format_of :last_name, :with => /^[a-zA-Z ]*$/i,
											:message => "can only contain letters.",:multiline => true										
	validates :last_name, length: { minimum: 3 }
	validates :phone, length: { minimum: 10,maximum: 11},
										numericality: { only_integer: true },
										uniqueness: true
	validates_associated :my_school , :if => :user_not_admin?

	def user_not_admin?
		role == "admin" ? false : true
	end

end

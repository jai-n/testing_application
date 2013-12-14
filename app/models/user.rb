class User < ActiveRecord::Base
	ROLES = %w[admin teacher student]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_one :my_school, through: :user_school    
end

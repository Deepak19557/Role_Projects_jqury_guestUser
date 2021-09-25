class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :appointments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    after_create :creating_role

    def creating_role
    	use = User.last
    	if use.role == 'Patient'
    		Patient.create(name: use.name)
    	elsif use.role == 'Doctor'
    		Doctor.create(name: use.name)
    	end
    end
end

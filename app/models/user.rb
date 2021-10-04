class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :appointments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #validates :email, presence: true, :password_digest, unless: :guest? 
  #end


    after_create :creating_role

   # has_secured_password
    require 'bcrypt'
    attr_reader :password
    #include ActiveModel::SecurePassword::InstanceMethodOnActivation

    # def self.new_guest
    #   new { |u| u.guest = true }
    # end

    def creating_role
    	user = User.last
    	if user.role == 'Patient'
    		Patient.create(name: user.name)
    	elsif user.role == 'Doctor'
    		Doctor.create(name: user.name , email: user.email)
    	end
    end

  
end

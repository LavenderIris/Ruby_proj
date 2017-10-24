class User < ApplicationRecord
    has_secure_password
    
    validates :firstname, :lastname, presence: true 
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates_uniqueness_of :email, presence: true 
    
    def email= email
      super(email.try(:downcase))
    end
  
    validates :password, length: {in: 8..30}
    # validates :password, presence: true, length: {in: 8..30}, on: :create
  
end

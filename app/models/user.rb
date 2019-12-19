class User < ActiveRecord::Base
    
    has_secure_password

    validates :username, :email_address, :password, presence: true
    validates :username, :email_address, uniqueness: true
    validates :password, length: {in: 4..10}
end
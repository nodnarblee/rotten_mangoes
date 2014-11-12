class User < ActiveRecord::Base
  
  has_secure_password
  has_many :reviews

  after_destroy :send_destroy_email

  validates :email, uniqueness: true

  def full_name
    "#{firstname} #{lastname}"
  end

  def send_destroy_email

  end 
  
end

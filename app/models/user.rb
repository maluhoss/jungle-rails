class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password

  validates :first_name, :last_name, :password, presence: true
  validates :email, uniqueness: true, presence: true

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = User.find_by(email: email)

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
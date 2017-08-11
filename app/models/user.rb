class User < ApplicationRecord
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  has_secure_password

  def password=(value)
    @password = value
    self.password_digest = BCrypt::Password.create(value)
    end

  def password
    @password
  end

  def is_valid?(current_password)
    BCrypt::Password.new(current_password) == password_digest
  end
  

end

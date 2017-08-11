class User < ApplicationRecord
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  has_many :friendships, dependent :destroy
  has_many :friends, through: :friendships
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

#  def friends
#   result[]
#   friendships.each do |f|
#     result << f.friend
#     end
#    result
#   end

  def add_friend(another)

  end

  def friend_names
    friends.map{|e| e.name}
    end
  

end

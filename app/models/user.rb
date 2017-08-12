class User < ApplicationRecord
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  has_many :friendships, dependent: :destroy
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

  #---------------------------------------------------------

  #def self.from_omniauth(auth)

  # email = auth[:info][:email] || "#{auth[:uid]}@facebook.com"
  # user = where(email: eamil).first_or_initialize
  # user.image_url = auth[:info][:image]
  # user.name = auth[:info][:name]
  # user.password = SecureRandom.hex
  #user.save && user
  #end

#-----------------------------------------------------------

#  def friends
#   result[]
#   friendships.each do |f|
#     result << f.friend
#     end
#    result
#   end


  def image_default
    image_url.precsence || "http://lorempixel.com/128/128/sports/fake-user/"

  def add_friend(another)
    friends << another
  end

  def is_friend?(another_user)
    friends.include?(another_user)
  end

  def friend_names
    friends.map{|e| e.name}
  end

  def self.except(user)
    all - [user]
  end

  def self.recipient_options(user)
    except(user).map{|e| [e.name, e.id]}
  end  

end

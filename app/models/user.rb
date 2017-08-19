class User < ApplicationRecord
  validates :email, presence: true

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :sent_messages, class_name:"Message", foreign_key:"sender_id"
  has_many :recipient_messages, class_name:"Message", foreign_key:"recipient_id" 

  mount_uploader :avatar, AvatarUploader

  has_many :posts, foreign_key: "poster_id", dependent: :destroy
  has_many :posts_on_his_wall, class_name: 'Post', foreign_key: 'wall_user_id'
  has_many :likes, dependent: :destroy

  has_secure_password

  # def password=(value)
  #   @password = value
  #   self.password_digest = BCrypt::Password.create(value)
  #   end

  # def password
  #   @password
  # end

  # def is_valid?(current_password)
  #   BCrypt::Password.new(current_password) == password_digest
  # end

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
#   result = []
#   friendships.each do |f|
#     result << f.friend
#   end
#   result
#  end
#------------------------------------------------------------

  def image_default
    avatar.url || "http://lorempixel.com/128/128/sports/fake-user/"
  end 

  def another_image
    image_url.presence || "http://lorempixel.com/128/128/sports/fake-user/"
  end  

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

   def self.generate_users(u)
     url = "https://randomuser.me/api?gender=female&results=#{u}"
     response = HTTP.get(url)
     data = response.parse
     people = data["results"]
     people.each do |p|
       name = p["name"]["first"] + " "+p["name"]["last"]
       User.create!(
        name: name.titleize, password: p["login"]["password"],
        email: p["email"] #image_url: p["picture"]["large"]
       ) 
     end  
   end  


  def toggle_like!(item)
    if like = likes.where(item: item).first
      like.destroy
    else
      likes.where(item: item).create!
   end  
  end

  def name_or_email
    name.present? ? name : email
  end 

  def liking?(item)
    likes.where(item: item).exists?
  end



end

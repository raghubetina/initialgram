class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader

  has_many :pictures, dependent: :destroy

  validates :username, presence: :true, format: { with: /\A[a-zA-Z0-9]+\Z/ }

  has_many :follows_where_followee, class_name: "Follow", foreign_key: "followee_id", dependent: :destroy
  has_many :follows_where_follower, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy

  has_many :followers, through: :follows_where_followee, source: :follower
  has_many :following, through: :follows_where_follower, source: :followee

  has_many :feed, through: :following, source: :pictures

  # def feed
  #   users = self.following

  #   result = []
  #   users.each do |user|
  #     user.pictures.each do |picture|
  #       result << picture
  #     end
  #   end

  #   return result
  # end

  # or

  # has_many :feed, .....

  # def followers
  #   follows_where_followee = Follow.where(:followee_id => self.id)

  #   result = []
  #   follows_where_followee.each do |follow|
  #     result << follow.follower
  #   end

  #   return result
  # end

  # def following
  #   follows_where_follower = Follow.where(:follower_id => self.id)

  #   result = []
  #   follows_where_follower.each do |follow|
  #     result << follow.followee
  #   end

  #   return result
  # end
end









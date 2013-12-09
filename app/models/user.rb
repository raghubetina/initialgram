class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader

  has_many :pictures

  validates :username, presence: :true, format: { with: /\A[a-zA-Z0-9]+\Z/ }

  def followers
    follows_where_followee = Follow.where(:followee_id => self.id)

    result = []
    follows_where_followee.each do |follow|
      result << follow.follower
    end

    return result
  end

  def following

  end
end

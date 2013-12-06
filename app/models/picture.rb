class Picture < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :user

  validates :user, presence: :true
  validates :image, presence: :true
end

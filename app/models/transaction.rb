class Transaction < ActiveRecord::Base
  belongs_to :product
  
  mount_uploader :north, PictureUploader
  mount_uploader :north_east, PictureUploader
  mount_uploader :north_west, PictureUploader
  mount_uploader :south, PictureUploader
  mount_uploader :south_east, PictureUploader
  mount_uploader :south_west, PictureUploader
  mount_uploader :east, PictureUploader
  mount_uploader :west, PictureUploader
  mount_uploader :image1, PictureUploader
  mount_uploader :image2, PictureUploader
  mount_uploader :image3, PictureUploader
  mount_uploader :image4, PictureUploader
  validates :name, presence: true
end
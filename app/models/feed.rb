class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: { maximum: 30 }
  validates :image, presence: true
  validates :content, presence: true, length: { maximum: 40 }
end

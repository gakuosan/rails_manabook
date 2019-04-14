class Feed < ApplicationRecord
   mount_uploader :image,ImageUploader
   belongs_to :user
  
   validates :title, presence: true, length: { maximum: 20 }
   validates :image, presence: true
   validates :content, presence: true, length: { maximum: 50 }
   belongs_to :user    
end

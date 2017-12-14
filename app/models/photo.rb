class Photo < ApplicationRecord
  belongs_to :event
  mount_uploader :image, ImageUploader

  validates :image, presence: true
  validates :event, presence: true
end

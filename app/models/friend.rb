class Friend < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  belongs_to :user
  has_many :activitys

  has_attachment :avatar
  has_attachments :pictures, maximum: 5
end

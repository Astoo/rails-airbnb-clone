class Friend < ApplicationRecord
  belongs_to :user
  has_many :activitys

  has_attachment :avatar
  has_attachments :pictures, maximum: 5
end

class Friend < ApplicationRecord
  belongs_to :user
  has_many :activitys

  validates :name, presence: true
  validates :description, presence: true
  validates :name, presence: true

  has_attachment :avatar
  has_attachments :pictures, maximum: 5
end

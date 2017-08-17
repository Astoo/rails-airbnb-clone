class Friend < ApplicationRecord
  belongs_to :user
  has_many :activitys
  has_attachment :avatar
  has_attachments :pictures, maximum: 5

  geocoded_by :full_address
  after_validation :geocode, if: :full_address_changed?

  def full_address
    "#{address}, #{zip_code} #{city} #{ISO3166::Country[country].name}"
  end

  def full_address_changed?
    address_changed? || zip_code_changed? || city_changed? || country_changed?
  end


end

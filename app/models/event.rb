class Event < ApplicationRecord

  EVENT_TYPES = ['Dance', 'Movie', 'Food', 'Presentation', 'Sport', 'Casual']
  BARGAIN_PRICE = 20

  belongs_to :user
  has_and_belongs_to_many :themes
  has_many :photos
  
  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}
  validates :starts_at, presence: true
  validates :category, presence: true
  validates :ends_at, presence: true, unless: :ends_at_before_starts_at
  # validates :ends_at_before_starts_at,

  # private

  def bargain?
    price < BARGAIN_PRICE
  end

  def self.order_by_price
    order :price
  end


  def ends_at_before_starts_at
    if ends_at.to_i < starts_at.to_i
      errors.add(:ends_at, "cannot take place before start time")
      return true
    else
      return false
    end
  end

end

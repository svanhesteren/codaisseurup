class Event < ApplicationRecord

  EVENT_TYPES = ['Dance', 'Movie', 'Food', 'Presentation', 'Sport', 'Casual']

  belongs_to :user
  has_and_belongs_to_many :themes

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}
  validates :starts_at, presence: true
  validates :category, presence: true
  validates :ends_at, presence: true
  validate :ends_at_before_starts_at

  private

  def ends_at_before_starts_at
    if ends_at.to_i < starts_at.to_i
      errors.add(:ends_at, "cannot take place before start time")
    end
  end

end

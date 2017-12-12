class Event < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  # validates :ends_at, :if => :is_newer?
  # validates if: :ends_at > :starts_at

  def is_newer?
    return Event.ends_at > Event.starts_at
  end

end

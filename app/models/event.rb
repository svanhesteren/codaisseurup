class Event < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}
  validates :starts_at, presence: true
  validates :ends_at, presence: true#, :is_newer? => true
  # validates if: :ends_at > :starts_at

  def is_newer?
    return ends_at > starts_at
  end

end

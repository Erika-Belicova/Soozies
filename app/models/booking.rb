class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :soozie

  validates :start_date, :end_date, presence: true

  def duration_in_days
    (end_date - start_date).to_i + 1
  end
end

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :soozie

  def duration_in_days
    (end_date - start_date).to_i + 1
  end
end

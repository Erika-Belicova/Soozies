class Soozie < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_one_attached :photo
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
  validates :first_name, :last_name, :gender, :city, :price, presence: true

  def name
    "#{first_name} #{last_name}"
  end



end

class Soozie < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_one_attached :photo
  validates :first_name, :last_name, :gender, :city, :price, presence: true

  def name
    "#{first_name} #{last_name}"
  end



end
